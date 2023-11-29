module Resolvers
  class GithubUser < GraphQL::Schema::Resolver
    argument :github_login, String, required: true

    type Types::GithubUserType, null: false

    def resolve(github_login:)
      user_data = fetch_github_data(github_login)

      {
        name: user_data['name'],
        repos: user_data['repos'].map { |repo| repo['name'] }
      }
    end

    private

    def fetch_github_data(github_login)
      user_response = HTTParty.get("https://api.github.com/users/#{github_login}")
      repos_response = HTTParty.get("https://api.github.com/users/#{github_login}/repos")

      user_data = JSON.parse(user_response.body)
      repos_data = JSON.parse(repos_response.body)

      { 'name' => user_data['name'], 'repos' => repos_data }
    end
  end
end

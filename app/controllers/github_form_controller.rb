
class GithubFormController < ApplicationController
  def index
  end

  def submit
    @github_login = params[:github_login]
    @graphql_query = params[:query].presence || default_graphql_query

    result = TestTaskSchema.execute(
      @graphql_query,
      variables: { githubLogin: @github_login }
    ).to_h

    if result.key?('errors')
      @error_message = result['errors'].first['message']
    else
      @github_user = result.dig('data', 'githubUser')
    end
  end

  private

  def default_graphql_query
    <<~GRAPHQL
      query($githubLogin: String!) {
        githubUser(githubLogin: $githubLogin) {
          name
          repos
        }
      }
    GRAPHQL
  end
end

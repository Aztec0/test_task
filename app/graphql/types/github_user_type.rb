module Types
  class GithubUserType < Types::BaseObject
    field :name, String, null: true
    field :repos, [String], null: true
  end
end
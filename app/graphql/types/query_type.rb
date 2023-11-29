# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :github_user, resolver: Resolvers::GithubUser
  end
end

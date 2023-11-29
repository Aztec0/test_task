Rails.application.routes.draw do
  get 'github_form/index'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  get 'github_form/index'
  get 'github_form/submit'
  root 'github_form#index'
end

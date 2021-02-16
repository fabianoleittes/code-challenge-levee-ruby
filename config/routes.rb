# require 'api_version'
Rails.application.routes.draw do
  scope defaults: { format: :json }, path: '/' do
    namespace :v1 do
      post 'signup', to: 'users#create'
      post 'auth/login', to: 'auth#authenticate'
      resources :jobs, only: %i[create index update]
      get 'category(/:id)', to: 'jobs_summaries#show'
    end
  end
end

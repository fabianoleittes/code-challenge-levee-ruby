Rails.application.routes.draw do
  namespace :v1 do
    post 'signup', to: 'users#create'
  end
end

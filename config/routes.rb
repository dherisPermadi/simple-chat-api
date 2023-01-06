Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users', defaults: { format: :json }
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :conversations
      resources :users
    end
  end
end

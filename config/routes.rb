Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users', defaults: { format: :json }
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create, :destroy] do
        collection do
          post :read_all_text
        end

        member do
          post :read_text
        end
      end
      resources :contacts
      resources :conversations, only: [:index, :destroy]
      resources :users, only: :show
    end
  end
end

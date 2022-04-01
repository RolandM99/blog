Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

    namespace :api, default: {format: :json} do
      namespace :v1,  default: {format: :json} do
        post 'login', to: 'authentication#authenticate'
        post 'register', to: 'users#create'
        resources :users do
          resources :posts, only: [:index, :show, :create] do
            resources :comments, only: [:index, :create]
            resources :likes, only: [:create]
          end
        end
      end
    end
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts do
    resources :comments, only: %i[create new]
    resources :likes, only: [:create]
  end
end

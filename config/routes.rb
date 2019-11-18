Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  post '/auth/sign_up', to: 'authentication#sign_up'
  post '/auth/refresh', to: 'authentication#refresh'

  namespace :api do
    resources :users, only: [:index, :show, :update, :destroy]
    resources :exercises
    resources :workouts do
      resources :exercises
    end
  end

  get '/*a', to: 'application#not_found'
end

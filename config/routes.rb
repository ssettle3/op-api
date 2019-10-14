Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  post '/auth/sign_up', to: 'authentication#sign_up'

  namespace :api do
    resources :users, only: [:index, :show, :update, :destroy]
    resources :exercises
    resources :workouts
  end

  get '/*a', to: 'application#not_found'
end

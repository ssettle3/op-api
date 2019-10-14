Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  post '/auth/sign_up', to: 'authentication#sign_up'

  namespace :api do
    resources :users
    resources :exercises
    resources :workouts
  end

  get '/*a', to: 'application#not_found'
end

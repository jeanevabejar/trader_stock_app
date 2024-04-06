Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/admin', to: 'pages#admin', as: :pages_admin
  get 'pages/users', to: 'pages#users', as: :pages_user

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users,  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'admin/edit_user/:id', to: 'pages#edit_user', as: :edit_user
  patch 'admin/update_user/:id', to: 'pages#update_user', as: :update_user
  get 'admin/show_user/:id', to: 'pages#show_user', as: :show_user



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

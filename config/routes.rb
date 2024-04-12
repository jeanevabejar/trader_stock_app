Rails.application.routes.draw do

  root 'pages#home'

  get 'dashboard/user', to: 'pages#users', as: :pages_user
  get 'dashboard/admin', to: 'pages#admin', as: :pages_admin

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users,  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get 'admin/new trader', to: 'pages#new_user', as: :new_user
  post 'admin/create trader', to: 'pages#create_user', as: :create_user

  get 'admin/edit_user/:id', to: 'pages#edit_user', as: :edit_user
  patch 'admin/update_user/:id', to: 'pages#update_user', as: :update_user
  get 'admin/show_user/:id', to: 'pages#show_user', as: :show_user

  post '/dashboard/user', to: 'pages#users'

  get '/transaction/new', to: 'transactions#new_transaction', as: :new_transaction

  post '/transaction/create_transaction', to: 'transactions#create_transaction', as: :create_transaction

end

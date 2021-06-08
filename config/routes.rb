Rails.application.routes.draw do
  devise_for :users
  namespace :public do
   resources :users, only: [:index, :create, :update, :destroy, :edit]
  end
 end
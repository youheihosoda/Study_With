Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :public do
   resources :users, only: [:index, :create, :update, :destroy, :edit]
  end

  namespace :public do
    resources :start_times, only: [:create, :index, :update]
  end
 end
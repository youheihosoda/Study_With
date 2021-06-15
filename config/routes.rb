Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :public do
   resources :users, only: [:index, :create, :update, :destroy, :edit, :show]
    resources :posts, only:[:create,:index,:show,:update,:new]
    resources :study_times, only: [:create, :index, :update,:new]
  end
 end
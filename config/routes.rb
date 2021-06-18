Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :public do
   resources :users, only: [:index, :create, :update, :destroy, :edit, :show]
    resources :posts, only:[:create,:index,:show,:update,:new]
    resources :study_times, only: [:create, :index, :update,:new, :edit,:destroy]do
     member do
     patch :stop_time
     end
     collection do
     post  :start_time
     get :top
     end
     end
    resources :study_texts, only:[:create, :update,:destroy]
    resources :learning_details, only:[:create,:update,:destroy,:new]
  end
 end
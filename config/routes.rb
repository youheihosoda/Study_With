Rails.application.routes.draw do
  devise_for :admins

  get 'contacts/new'
  get 'contacts/create'

  devise_for :users
  devise_scope :user do
   root to: "devise/sessions#new"
  end
  namespace :public do
   resources :users, only: [:index, :create, :update, :destroy, :edit, :show]do
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'

     collection do
      get 'unsubscribe'
      patch "withdrawal"
     end
   end

   resources :posts, only:[:create,:index,:show,:update,:new]
   resources :study_times, only: [:create, :index, :update,:new, :edit,:destroy,:show]do
   resources :post_comments, only:[:create,:destroy]
   resource :favorites, only: [:create, :destroy]
    member do
     patch :stop_time
    end
    collection do
     post  :start_time
     get :top
    end
   end
   resources :study_texts, only:[:create, :update,:destroy,]
   resources :study_time_texts, only:[:index]
   resources :learning_details, only:[:create,:update,:destroy,:new]
   resources :photos, only: [:new, :create, :destroy]
   resource :relationships, only: [:create, :destroy]
   get '/search', to: 'searchs#search'
  end
   resources :contacts, only:[:new, :create]

 namespace :admin do
  resources :users, only:[:index,:show]
 end

 end
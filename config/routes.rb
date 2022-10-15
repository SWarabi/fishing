Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'public/homes#top'
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }
  
  devise_for :users ,  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  namespace :public do
    # resources :fishings
    resources :notifications, only: :index
    get "/unsubscribe"=>"users#unsubscribe"
    get '/search', to: 'searchs#search'
    patch "/withdrawal"=>"users#withdrawal"
    get '/map_request', to: 'maps#map', as: 'map_request'
    resources :catches, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :catch_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
    resources :favorites, only: [:index]
    resources :oldes, only: [:index]
    resources :drafts, only: [:index, :edit, :create]
    
    resources :followers, only: :show
    resources :followings, only: :show
    resources :users, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      #フォローフォロワー
      resource :relationships, only: [:create, :destroy]
      #get 'followings' => 'relationships#followings', as: 'followings'
      #get 'followers' => 'relationships#followers', as: 'followers'
      
      member do
        get :favorites
      end
    end
  end
  
  namespace :admins do
    get '/search', to: 'searchs#search'
    resources :users,only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :catches,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :catch_comments, only: [:destroy]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
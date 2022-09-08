Rails.application.routes.draw do
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
    get "/unsubscribe"=>"users#unsubscribe"
    patch "/withdrawal"=>"users#withdrawal"
    resources :users
    resources :catches,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :catch_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
  end
  
  namespace :admins do
    resources :users
    resources :catches,only: [:new, :create, :index, :show, :destroy, :edit, :update] 
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'public/homes#top'
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users ,  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  namespace :public do
    resources :fishings
    resources :catches,only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  namespace :admin do
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

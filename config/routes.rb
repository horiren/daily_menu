Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root 'homes#top'
    get "search" => "searches#search"
    resources :recipes do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      member do
        get :likes
      end
    end
    
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    devise_scope :user do
      post 'guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end
  
  namespace :admin do
    get '/' => 'homes#top'
    get "search" => "searches#search"
    
    resources :recipes do
      resources :post_comments, only: [:destroy, :create]
    end
    
    
    resources :users, except: [:create, :new]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

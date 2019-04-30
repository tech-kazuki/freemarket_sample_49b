Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "products#index"
  resources :products, only: [:index] do
    collection do
      get 'buy'
    end
  end

  resources :users, only: [:show] do
    resources :products, only: [:new, :create]
    resource :address, only: [:new, :create, :edit, :update, :destroy]
    resource :card, only: [:new, :create, :edit, :update, :destroy]
    collection do
      get 'logout'
    end
  end

  devise_scope :user do
    get 'index' => 'users/registrations#index'
    get 'certification' => 'users/registrations#certification'
    get 'complete' => 'users/registrations#complete'
  end
end

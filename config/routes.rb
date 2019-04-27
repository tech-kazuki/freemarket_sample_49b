Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "products#index"
  resources :products, only: [:index, :new]
  resources :users, only: [:show] do
    resource :address, only: [:new, :create, :edit, :update, :destroy]
    resource :card, only: [:new, :create, :edit, :update, :destroy]
  end
  devise_scope :user do
    get 'index' => 'users/registrations#index'
    get 'certification' => 'users/registrations#certification'
    get 'complete' => 'users/registrations#complete'
  end
end

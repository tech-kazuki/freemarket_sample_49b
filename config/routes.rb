Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "products#index"

  resources :categories, only: [:index, :show]

  resources :categories, only: [:index, :show]

  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'credit'
      get 'logout'
    end
    resources :likes, only: :index
    resources :products, only: [:new, :create, :show] do
      member do
        get 'buy'
        post 'pay'
        get 'pay_after'
      end
      resources :likes, only: [:create, :destroy]
    end
    resource :address, only: [:create, :edit, :update, :destroy]
    resource :card, only: [:new, :create, :edit, :update, :destroy]
  end

  devise_scope :user do
    get 'index' => 'users/registrations#index'
    get 'complete' => 'users/registrations#complete'
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "products#index"
  
  # 商品情報が保存できるようになったら、データベースから引っ張るため、ネストする。
  resources :products, only: [:index] do
    collection do
      get 'buy'
    end
  end

  resources :users, only: [:show] do
    resources :products, only: [:new, :create, :show]
    resource :address, only: [:create, :edit, :update, :destroy]
    resource :card, only: [:create, :edit, :update, :destroy]
    collection do
      get 'logout'
    end
  end

  devise_scope :user do
    get 'index' => 'users/registrations#index'
    get 'complete' => 'users/registrations#complete'
  end
end

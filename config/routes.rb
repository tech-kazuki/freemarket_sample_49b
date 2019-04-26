Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root "products#index"
  resources :users, only: [:show] do
    resource :address, only: [:new, :create, :edit, :update, :destroy]
    resource :card, only: [:new, :create, :edit, :update, :destroy]
  end
  devise_scope :user do
    get 'index' => 'users/registrations#index'
  end

end

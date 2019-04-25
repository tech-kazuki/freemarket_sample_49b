Rails.application.routes.draw do
 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'index' => 'users/registrations#index'
  end

end
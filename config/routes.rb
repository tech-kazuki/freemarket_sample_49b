Rails.application.routes.draw do
 devise_for :users, controllers: { 
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'}
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'index' => 'users/registrations#index'
    get 'facebook' => 'users/registrations#facebook'
  end

end
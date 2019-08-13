Rails.application.routes.draw do

  root to: 'pages#home'

  devise_scope :user do
    get "/" => "devise/sessions#new" # custom path to login/sign_in
    get "/" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users

  resources :missions do
    resources :participations, only: [:new, :create]
  end

  get "/dashboard", to:"pages#dashboard"
  #resources :participations, only: [:show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'pages#home'
  resources :missions do
    resources :participations, only: [:new, :create]
  end
  get "/dashboard", to:"pages#dashboard"
  #resources :participations, only: [:show, :destroy]
  devise_for :users, path: 'auth', skip: [:sessions],
             controllers: {
                 sessions: 'users/sessions'
             }

  as :user do
    get 'auth/sign_in' => 'home#index', as: :new_user_session
    post 'auth/sign_in' => 'users/sessions#create', as: :user_session
    delete 'auth/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

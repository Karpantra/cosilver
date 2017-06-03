Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :providers, controllers: { registrations: "providers/registrations", sessions: "providers/sessions", passwords: "providers/passwords"}
  root to: 'pages#home'
  resources :users, only: [:update] do
    collection do
      get "profile"
    end
  end

  # resources :services, only [:create] do
  #   collection do
  #     post "dashboard"
  #   end
  # end
  # resources :flats, only: [:show] do
  #   collection do
  #     get "dashboard"
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :offers, only: [:new, :create]
  end
  resources :offers, except: [:new, :create]

  resources :services do
    resources :availabilities, only: [:new, :create]
  end

  resources :availabilities


  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end

end

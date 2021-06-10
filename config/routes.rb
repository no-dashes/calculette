Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello', to: 'welcome#hello'
  resources :calculations
  resources :categories

  resource :account, only: [:new, :create] do
    member do
      get 'verify/:user_id/:token', action: 'verify', as: 'verify'
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resource :profile, only: [:show, :update]

  root to: redirect('/calculations')
end

Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  resource :home, only: [:show]
  root to: "questions#index"
  resources :questions, except: [:destroy] do
    resources :answers, except: [:index, :show]
  end
end

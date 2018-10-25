# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :admin do
    get 'landing', to: 'landing#index'

    resources :players
    resources :users
  end

  resources :pairings, only: [:create, :destroy]
  resources :games, only: [:edit, :update]

  resources :schools, only: [:edit, :update, :index]
  resources :sports do
    resources :tournaments
  end

  resources :tournaments do
    resources :teams
  end
end

Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get "landing" => "landing#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars

  # VERB PATH, to: "CONTROLLER#ACTION", as: "PREFIX"
  get "search", to: "cars#search", as: "search"
end

Rails.application.routes.draw do
  get 'reviews_controller/new'
  get 'reviews_controller/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars do
    resources :reservations, only:[:create]
      resources :reviews, only:[:new, :create]
  end

  resources :reservations, only:[:index, :show, :edit, :update, :destroy]

  # VERB PATH, to: "CONTROLLER#ACTION", as: "PREFIX"
  get "search", to: "cars#search", as: "search"
  # get "reviews/:id", to: "reviews#show"
end

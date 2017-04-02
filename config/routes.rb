Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root 'sessions#new'

  resources :messages, only: [:index, :create]
  post '/change_dialect', to: 'messages#dialect'

  resource :sessions, only: [:new, :create, :destroy]

end

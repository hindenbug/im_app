Rails.application.routes.draw do

  root 'sessions#new'
  resource :sessions, only: [:new, :create, :destroy]

end

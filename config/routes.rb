Rails.application.routes.draw do
  # Add route from Readme

  resources :birds, except: [:update, :destroy]


end
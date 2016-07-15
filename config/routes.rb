Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: [:index]

  root 'high_voltage/pages#show', id: 'about'
end

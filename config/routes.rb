Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: [:index]
  resources :schedules

  get 'rdsstart', to: 'skejulers#rdsstart'
  get 'rdsstop', to: 'skejulers#rdsstopt'
  get 'ec2start', to: 'skejulers#ec2start'
  get 'ec2stop', to: 'skejulers#ec2stop'

  root 'high_voltage/pages#show', id: 'about'
end

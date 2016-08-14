Rails.application.routes.draw do
  get 'cloud_accounts/show'

  get 'cloud_accounts/new'

  get 'cloud_accounts/edit'

  get 'cloud_accounts/delete'

  get 'cloud_accounts/index'

  get 'cloud_account/index'

  devise_for :users

  resources :dashboard, only: [:index]
  resources :schedules
  resources :users, except: [:new]

  get 'rdsstart', to: 'skejulers#rdsstart'
  get 'rdsstop', to: 'skejulers#rdsstopt'
  get 'ec2start', to: 'skejulers#ec2start'
  get 'ec2stop', to: 'skejulers#ec2stop'

  root 'high_voltage/pages#show', id: 'about'
  match ':controller(/:action(/:id))',:via =>[:get, :post]

end

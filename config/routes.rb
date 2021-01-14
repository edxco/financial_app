Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  resources :users
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :groups

  resources :transactions

  get '/profile', to: 'pages#profile'
  get '/newgroup', to: 'groups#new'
  get '/newtransaction', to: 'transactions#new'
  get '/etransactions', to: 'transactions#etransaction'
  get '/memberstransactions', to: 'transactions#members_transactions'

end

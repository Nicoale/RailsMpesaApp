Rails.application.routes.draw do
  get 'statistics/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/new', to: 'users#new', as: 'new_user'
  post 'users/', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'deposit/:phone_number', to: 'deposits#show', as: 'deposits'
  get 'withdrawal/:phone_number', to: 'withdrawal#show', as: 'withdrawals'
  get 'send/:phone_number', to: 'send#show', as: 'sends'
  get 'login', to:'sessions#new', as:'login'
  post '/login', 'sessions#create'
  root to:'statistics#home'
end

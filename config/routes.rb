Rails.application.routes.draw do

  get 'sessionz/new', as: 'login'
   root to:'statistics#home'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get 'users/new', to: 'users#new', as: 'new_user'
   post 'users/', to: 'users#create'
   get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/login', to: redirect('/auth/google_oauth2'), as: 'login'

  # # get 'login', to:'sessions#new', as:'login'
  # # post '/login', to:'sessions#create'
  
  # # delete '/logout', to: 'sessions#destroy'
  
  
  # get 'deposit/new', to: 'sessions#new', as: 'new_deposit'
  # post 'deposit/', to:'deposits#create'
  # get 'deposit/:phone_number', to: 'deposits#show', as: 'deposits'
  


  # get 'withdrawal/new', to: 'withdrawal#new', as: 'amount'
  # post 'withdrawal/', to:'withdrawal#create'
  # get 'withdrawal/:phone_number', to: 'withdrawal#show', as: 'withdrawals'


  # get 'send/new', to: 'send#new', as: 'send'
  # post 'send/new', to:'send#create'
  # get 'send/:phone_number', to: 'send#show', as: 'sends'
  
end
  
  
  
# Rails.application.routes.draw do 
  
# get 'nusers/login', to: redirect('/auth/google_oauth2'), as: 'login'
# get 'nuser/logout', to: 'sessions#destroy', as: 'logout'
# get 'auth/:provider/callback', to: 'sessions#create'
# get 'auth/failure', to: redirect('/')
# get 'home', to: 'home#index'
# get '/users/show', to: 'users#show', as: 'user'

# root to: "home#show"

# end


Rails.application.routes.draw do
  get '/users/login' => 'sessions#new'

  post '/users/login' => 'sessions#create'

  get '/users/logout' => 'sessions#delete'

  #Routes for users
  get '/users/signup' => 'users#new'

  get '/users/login' => 'users#login'

  post '/users/create' => 'users#create'


  #Routes for shopping list
  get '/', to: 'home#index'

  get '/new', to: 'home#new'

  post '/create', to: 'home#create'

  get '/edit/:id', to: 'home#edit'

  patch '/update', to: 'home#update'

  patch '/delete', to: 'home#delete'

end

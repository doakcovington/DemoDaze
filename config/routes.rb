Rails.application.routes.draw do
  root 'sessions#index'

  get '/signup' =>'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  post '/logout' => 'sessions#destroy' #Don't use get for logout

  
  
  resources :demo_reports
  resources :bikes
  resources :dealers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

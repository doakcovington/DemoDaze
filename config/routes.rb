Rails.application.routes.draw do
  root 'sessions#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' =>'users#new'
  post '/signup' => 'users#create'
  
  delete '/logout' => 'sessions#destroy' #Don't use get for logout

  
  
  resources :demo_reports
  resources :bikes do
    resources :demo_reports, only: [:new, :index]
  end
  resources :dealers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'sessions#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' =>'users#new'
  post '/signup' => 'users#create'
  
  delete '/logout' => 'sessions#destroy' #Don't use get for logout

  get '/auth/:provider/callback' => 'sessions#create'

  
  
  resources :demo_reports
  resources :bikes do
    resources :demo_reports, only: [:new, :index, :update] #nested route (shallow routing)
  end
  resources :dealers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

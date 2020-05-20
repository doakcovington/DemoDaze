Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/signup' =>'sessions#signup'
  get '/login' => 'sessions#login'
  resources :demo_reports
  resources :bikes
  resources :dealers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

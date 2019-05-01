Rails.application.routes.draw do
  root 'gossips#index'
  #get 'user/show'
  get 'welcome/:first_name', to: 'welcome#first_name'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  resources :gossips
  resources :users
end

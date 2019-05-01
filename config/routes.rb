Rails.application.routes.draw do
  # get 'cities/new'
  # get 'cities/create'
  # get 'cities/update'
  # get 'cities/edit'
  # get 'cities/destroy'
  # get 'cities/index'
  # get 'cities/show'
  root 'gossips#index'
  #get 'user/show'
  get 'welcome/:first_name', to: 'welcome#first_name'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  resources :gossips
  resources :users
  resources :cities
end

Rails.application.routes.draw do
  devise_for :users
  resources :games do
  resources :reviews
  end
  root 'games#index'

  resources :filters
end
# A resourceful route is declared in one line of code so you dont need to add index, destroy, edit and show routes

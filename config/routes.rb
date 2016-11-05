Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #users
  get 'profile' => 'users#profile'
  devise_for :users
  #events
  resources :events
  resources :invites, only: :index
  post  'invites'       =>  'invites#create'
  post  'confirmation/:id'   =>  'invites#confirm', as: "confirmation"

  #static_pages and sessions
  root 'static_pages#home'  
end

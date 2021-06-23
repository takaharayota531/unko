Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :books, only: [:new,:index,:show,:create,:destroy,:edit,:update]
  resources :users, only: [:show,:edit,:update,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

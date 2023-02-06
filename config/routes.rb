Rails.application.routes.draw do
  get 'registrations/edit'
  get 'messages/index'
  get 'messages/create'
  get 'messages/new'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'dashboard/index'
  resources :chats, except: [:edit, :update]
  resources :messages, only: [:create]
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

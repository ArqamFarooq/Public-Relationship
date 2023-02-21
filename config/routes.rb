Rails.application.routes.draw do
  # get 'registrations/edit'
  get 'messages/index'
  get 'messages/create'
  get 'messages/new'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, :controllers => { :registrations => "registrations" }
  root to: 'dashboard#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # end
  devise_scope :user do
    get 'users/:id', to: 'users#show', as: 'user'
  end
  get 'chat_rooms/show'
  get 'dashboard/index'
  resources :chats, except: [:edit, :update]
  resources :messages, only: [:create]
  # resources :registrations
  resources :chat_rooms do 
    resources :msgs
  end
  resources :posts
  post "/chat_rooms/:id/send_message", to: "chat_rooms#send_message", as: :send_message
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'registrations/edit'
  get 'messages/index'
  get 'messages/create'
  get 'messages/new'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'chat_rooms/show'
  get 'dashboard/index'
  resources :chats, except: [:edit, :update]
  resources :messages, only: [:create]
  resources :chat_rooms, only: [:index]
  resources :posts do
    resources :chat_rooms, only: [:show] do
      post :send_message, on: :member
    end
  end
  post "/chat_rooms/:id/send_message", to: "chat_rooms#send_message", as: :send_message
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

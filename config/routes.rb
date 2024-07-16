Rails.application.routes.draw do
  get 'lives/show'
  devise_for :users
  root 'comments#index'
  get 'comments/index'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  resources :users
  resources :live_rooms do
    resources :messages, only: [:create]
  end # ルーム作成に関するルート
  get 'chat', to: 'rooms#show' # 「チャットルーム」のリンクを押したらviews/rooms/show.htmlに遷移
  # root to: "rooms#show" # 一旦コメントアウト,チャット機能のページ
  mount ActionCable.server => '/cable'
  resources :lives, only: [:create, :new, :show] do
    resources :rooms, only: [:show]
    resource :chat_rooms, only: [] do
      resources :chat_messages, only: [:create]
    end
  end
end

Rails.application.routes.draw do
  # ユーザー認証
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # ルートパス
  root 'comments#index'
  # 静的ページ
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  # コメント
  get 'comments/index'
  # ライブ関連
  get 'lives/show'

  # アーティストとその楽曲
  resources :artists do
    resources :musics, only: [:index, :show]
  end
  # 楽曲
  resources :musics, only: [:index, :show]
  # ライブイベント
  resources :live_events, only: [:index, :show, :new, :create] do
    resources :musics, only: [:index, :show] # live_events に関連する musics
  end
  # ユーザー管理
  resources :users
  # ライブルームとメッセージ
  resources :live_rooms do
    resources :messages, only: [:create]
  end

  # チャットルーム
  get 'chat', to: 'rooms#show' # チャットルームの表示

  # ActionCableの設定
  mount ActionCable.server => '/cable'

  # ライブとチャット関連
  resources :lives, only: [:create, :new, :show] do
    resources :rooms, only: [:show]
    resource :chat_rooms, only: [] do
      resources :chat_messages, only: [:create]
    end
  end
end
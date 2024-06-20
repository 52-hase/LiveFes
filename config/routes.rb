Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  get 'comments/index'
  root 'comments#index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :live_rooms do
  end
end

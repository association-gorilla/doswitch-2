Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions',
  #   :passwords => 'users/passwords'
  # }
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:edit, :update, :destroy] do
    resources :verbs, only: [:create, :edit, :update, :destroy]
  end
end

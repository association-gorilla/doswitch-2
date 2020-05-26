Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root 'homes#top'
  get '/about' => 'homes#about'
  get "users/:user_id/verbs/:id/record_start" => "homes#record_start", as: "record_start"
  get "users/:user_id/verbs/:id/record_stop" => "homes#record_stop", as: "record_stop"
  get '/users/:user_id/verbs/:id/update_important' => 'verbs#update_important', as: "update_important"
  get '/users/:user_id/verbs/:id/update_selected' => 'verbs#update_selected', as: "update_selected"
  resources :users, only: [:edit, :update, :destroy] do
    resources :verbs, only: [:create, :index, :update, :destroy]
  end
end

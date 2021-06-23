Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies,:books,:users,:posts,:categories,:comments
  post '/:category_name/:item_id/users/:user_id/posts', to: 'posts#create'
  get '/:category_name/:item_id/users/:user_id/posts', to: 'posts#show_by_category'
  get '/post/:post_id/comments', to:'comments#show'
  post '/post/:post_id/comments', to:'comments#create'
  get '/:category_name/:item_id/users/:user_id/posts/:post_id/comments', to: 'comments#show_by_category'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'singup', to: 'users#create'
  delete 'logout', to: 'sessions#destroy'
end

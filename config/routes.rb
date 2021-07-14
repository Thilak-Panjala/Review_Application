Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  jsonapi_resources :movies
  resources :books,:users,:posts,:categories,:comments,:songs
  post '/:category_name/:item_id/posts', to: 'posts#create'
  get '/:category_name/:item_id/users/:user_id/posts', to: 'posts#show_by_category'
  get '/posts/:post_id/comments', to:'comments#show_by_posts'
  post '/posts/:post_id/comments', to:'comments#create'
  post '/:category_name/:item_id/posts/:post_id/comments', to:'comments#create'
  delete '/posts/:post_id/comments/:id', to:'comments#destroy'
  get '/:category_name/:item_id/users/:user_id/posts/:post_id/comments', to: 'comments#show_by_posts'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  delete 'logout', to: 'sessions#destroy'
end

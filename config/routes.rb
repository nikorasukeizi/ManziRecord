Rails.application.routes.draw do

  devise_for :users
  root to: 'items#top'

  #ArtistsLabelsGenresコントローラルーティング
  get 'artists_labels_genres/new'
  get 'artists_labels_genres/index'
  post '/artists_labels_genres/new' => 'artists_labels_genres#create'

  #Itemsコントローラルーティング
  resources :items
  get 'items/top'
  get 'items/search_result'
  get 'items/ranking'

  #Artistsコントローラルーティング
  resources :artists, only: [:edit, :update, :destroy]

  #Labelsコントローラルーティング
  resources :labels, only: [:edit, :update, :destroy]

  #Genresコントローラルーティング
  resources :genres, only: [:edit, :update, :destroy]
  get 'genres/:id/ranking' => 'genres#ranking', as: 'genres_ranking'

  #Buy_infosコントローラルーティング
  resources :buy_infos, only: [:index, :show, :edit, :update, :destroy]
  get 'buy_infos/complete'

  # Usersコントローラルーティング
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/buy_history'
  get 'users/withdraw_view'
  get 'users/:id/cart' => 'users#cart_show'
  get 'users/buy'
  get 'users/buy_confirm'
  get 'users/cart', as: 'guest_cart'
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
  patch '/users/:id/cart' => 'users#cart_update', as: 'user_cart'
  delete '/users/:id/cart' => 'users#cart_destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

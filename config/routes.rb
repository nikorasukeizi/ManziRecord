Rails.application.routes.draw do

  devise_for :users
  root to: 'items#top'

  #ArtistsLabelsGenresコントローラルーティング
  get 'artists_labels_genres/new'
  get 'artists_labels_genres/index'
  post '/artists_labels_genres/new' => 'artists_labels_genres#create'

  #Itemsコントローラルーティング
  resources :items do
    resource :cart_items, only: [:create, :destroy, :update] #cart_itemsをネスト
  end
  get 'items/top'
  get 'items/search_result'
  get 'items/ranking'
  get 'items/:id/genre_index' => 'items#genre_index', as: 'genres_index'

  #Cart_itemsコントローラルーティング

  #Artistsコントローラルーティング
  resources :artists, only: [:edit, :update, :destroy]

  #Labelsコントローラルーティング
  resources :labels, only: [:edit, :update, :destroy]

  #Genresコントローラルーティング
  get 'genres/:id/ranking' => 'genres#ranking', as: 'genres_ranking'
  resources :genres, only: [:edit, :update, :destroy]

  #Buy_infosコントローラルーティング
  get 'buy_infos/complete', as: 'buy_infos_complete'
  post 'buy_infos/complete'
  resources :buy_infos, only: [:index, :show, :edit, :update, :destroy]

  # Usersコントローラルーティング

  get 'users/:id/buy_history' => 'users#buy_history', as: 'user_buy_history'
  get 'users/buy_history'
  get 'users/withdraw_view' => 'users#withdraw_view'
  post 'cart_items' => 'user#cart_create'
  get 'users/buy', as: 'users_buy'
  get 'users/buy_confirm', as: 'users_buyconfirm'
  post 'users/buy_confirm'
  get 'users/cart_show', as: 'users_cart'
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

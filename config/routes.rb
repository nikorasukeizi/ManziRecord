Rails.application.routes.draw do

  root to: 'items#top'

  #ArtistsLabelsGenresコントローラルーティング
  get 'artists_labels_genres/new'
  get 'artists_labels_genres/index'
  post '/artists_labels_genres/new' => 'artists_labels_genres#create'

  #Itemsコントローラルーティング
  get 'items/top'
  get 'items/show'
  get 'items/index'
  get 'items/search_result'
  get 'items/ranking'
  get 'items/new'
  get 'items/edit'
  post '/items/new' => 'items#create'
  patch '/items/:id' => 'items#update'

  #Artistsコントローラルーティング
  get 'artists/edit'
  patch '/artists/:id' => 'artists#update'

  #Labelsコントローラルーティング
  get 'labels/edit'
  patch '/labels/:id' => 'labels#update'

  #Genresコントローラルーティング
  get 'genres/ranking'
  get 'genres/edit'
  patch '/genres/:id' => 'genres#update'

  #Buy_infosコントローラルーティング
  get 'buy_infos/complete'
  get 'buy_infos/index'
  get 'buy_infos/show'
  get 'buy_infos/edit'
  patch '/buy_infos/:id' => 'buy_infos#update'

  # Usersコントローラルーティング
  get 'users/show'
  get 'users/edit'
  get 'users/buy_history'
  get 'users/withdraw_view'
  get 'users/index'
  get 'users/cart_show'
  get 'users/buy'
  get 'users/buy_confirm'
  patch '/users/:id' => 'users#update'
  patch '/users/:id/withdraw' => 'users#withdraw'
  patch '/users/:id/cart' => 'users#cart_update'
  delete '/users/:id/cart' => 'users#cart_destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

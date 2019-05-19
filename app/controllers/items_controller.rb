class ItemsController < ApplicationController

  def top
    if session[:cart] == nil
        session[:cart] == {}
    end

    @items_new = Item.all.order(created_at: "DESC")
    @items_rank = Item.all.order(sales: "ASC")

  end

  def show
      @item = Item.find(params[:id])
      @artist = @item.artist
      @label = @item.label
      @genre = @item.genre
      @discs = @item.discs
      @songs = @item.songs
      @cart = CartItem.new
  end

  def index
      @items = Item.all
  end

  def genre_index
      @genre = Genre.find(params[:id])
  end

  def search_result
  end

  def ranking
  end

  def new
      @item = Item.new
      @item.discs.build
      # @discs.songs.build
      @artists = Artist.all
      @labels = Label.all
      @genres = Genre.all
  end

  def edit
      @item = Item.find(params[:id])
      @item.discs.build
      # @discs.songs.build
      @artists = Artist.all
      @labels = Label.all
      @genres = Genre.all
  end

  def create
      item = Item.new(item_params)
      item.save
      redirect_to item_path(item.id)
  end

  def update
      item = Item.find(params[:id])
      item.update
      redirect_to item_path(item.id)
  end


 # @genre = Genre.find(params[:id])

      # if @genre = nil?
         @items = Item.all

      # else
      # @genreitems = @genre.item_id.all
      # end


  private
      #子要素・孫要素も一緒に許可する。　idと_destroyを必ず入れる
      def item_params
          params.require(:item).permit(:name, :artist_id, :label_id, :genre_id, :image, :price, :stock, :status, :sales,
                                        discs_attributes: [:id, :name, :_destroy,
                                        songs_attributes: [:id, :name, :number, :_destroy]])
      end
end

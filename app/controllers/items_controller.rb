class ItemsController < ApplicationController


  before_action :after_login, only: [:top]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]


  def top
    if session[:cart] == nil
        session[:cart] == {}
    end

    @items_new = Item.all.order(created_at: "DESC")
    @items_rankall = Item.all.order(sales: "DESC")
    

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
      @item = Item.new(item_params)
      if @item.save
         redirect_to item_path(@item.id)
      else
         @item.discs.build
         # @discs.songs.build
         @artists = Artist.all
         @labels = Label.all
         @genres = Genre.all
         render :new
      end
  end

  def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
         redirect_to item_path(@item.id)
      else
         @item.discs.build
         # @discs.songs.build
         @artists = Artist.all
         @labels = Label.all
         @genres = Genre.all
         render :edit
      end
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to user_path(current_user.id)
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


      # ログイン後にユーザの年齢を登録
      def after_login
       if user_signed_in? && current_user.age == nil
        current_user.update(age: (Date.today.strftime('%Y%m%d').to_i - current_user.birthdate.strftime('%Y%m%d').to_i) / 10000)
       end
      end

      def require_admin
          if current_user.admin?
          else
             redirect_to root_path
          end
      end
   

end


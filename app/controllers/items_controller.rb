class ItemsController < ApplicationController


  before_action :after_login, only: [:top]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]


  def top
    if session[:cart] == nil
        session[:cart] = {}
    end

    # 新着情報
    @items_new = Item.all.order(created_at: "DESC")
    # ランキング表示
    @items_rank = Item.joins(:buy_items)
          .where(buy_items: {created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month})
          .group("item_id")
          .order("sum(buy_items.buy_count) desc, items.id")
          .select("items.*,sum(buy_items.buy_count) as sum_buy_count")

    # 卍のランキング表示

    @items_manzirank = Item.joins({:buy_items => {:buy_info => :user}})
          .where(buy_items: {created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month})
          .where('users.age':0..18)
          .group("item_id")
          .order("sum(buy_items.buy_count) desc, items.id")
          .select("items.*,sum(buy_items.buy_count) as sum_buy_count")

  end

  def show
      @item = Item.find(params[:id])
      @artist = @item.artist
      @label = @item.label
      @genre = @item.genre
      @discs = @item.discs
      @songs = @item.songs
      @cart = CartItem.new
      @stock = @item.stock
  end

  def index
      @items = Item.order(id: :desc).page(params[:page]).per(12)
  end

  def genre_index
      @genre = Genre.find(params[:id])
      @items = @genre.items.order(id: :desc).page(params[:page]).per(12)
  end

  def search_result
    @genre = Genre.all
  end

  def ranking
    if params[:young].present?
      @genre = "young"
      @item_rank = ranking_younger.page(params[:page]).per(9)
    else
      @genre = "all"
      @item_rank = ranking_comp.page(params[:page]).per(9)
    end
    @rank_num = {}
    page_offset = 0
    if params[:page].to_i >= 2
      page_offset = (params[:page].to_i - 1) * 9
    end
    @item_rank.each_with_index do |item,i|
      @rank_num[item.id] = i + 1 + page_offset
    end
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
          if user_signed_in?

              if current_user.admin?
              else
                 redirect_to root_path
              end
          else
            redirect_to root_path

          end
      end
   

end


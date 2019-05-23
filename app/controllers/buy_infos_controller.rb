class BuyInfosController < ApplicationController

  before_action :require_admin, only: [:index, :show, :edit, :update]

  def complete
    if session[:buy_auth] == true
      buy_info = BuyInfo.new(buy_info_params)
      buy_info.save #購入情報をDBに保存する
      cart_items = CartItem.where(user_id: current_user.id)
      cart_items.each do |cart_item|
        buy_item = buy_info.buy_items.build(item_id: cart_item.item_id, price: cart_item.item.price, buy_count: cart_item.buy_count)
        buy_item.save #カートに入っているアイテム情報を、BuyItemsテーブルに保存する
        item = Item.find(cart_item.item_id)
        item.stock -= cart_item.buy_count
        item.save #購入された商品の在庫を、購入された分減算して保存
        cart_item.destroy #購入したユーザに紐づくCartItemテーブルのレコードを全削除
      end
      session[:buy_status] = nil
    else
      redirect_to root_path
    end
    session[:buy_auth] = false
  end

  def index
      @buyinfos = BuyInfo.all
  end

  def show
      @buyinfo = BuyInfo.find(params[:id])
      @user = @buyinfo.user
      @buyitems = @buyinfo.buy_items
  end

  def update_buy_status
      buyinfo = BuyInfo.find(params[:id])
      buyinfo.update(buy_info_params)
      redirect_to buy_info_path(buyinfo.id)
  end

  def edit
      @buyinfo = BuyInfo.find(params[:id])
  end


  def update
      buyinfo = BuyInfo.find(params[:id])
      buyinfo.update(buy_info_params)
      redirect_to buy_info_path(buyinfo.id)
  end

  private

  def buy_info_params
    params.require(:buy_info).permit(:user_id, :payments, :addressee, :delivery_postcode, :delivery_address, :buy_status,
                                      buy_items_attributes: [:buy_count, :id, :_destroy])
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

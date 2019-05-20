class BuyInfosController < ApplicationController

  def complete
    if session[:buy_auth] == true
      buy_info = BuyInfo.new(buy_info_params)
      buy_info.save
      carts = CartItem.where(user_id: current_user.id)
      carts.each do |cart|
        buy_item = buy_info.buy_items.build(item_id: cart.item_id, price: cart.item.price, buy_count: cart.buy_count)
        buy_item.save
        carts = CartItem.where(user_id: current_user.id)
        cart.destroy
      end
    else
      redirect_to root_path
    end
    session[:buy_auth] = false
  end

  def index
      @buyinfos = Buy_info.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def buy_info_params
    params.require(:buy_info).permit(:user_id, :payments, :addressee, :delivery_postcode, :delivery_address, :buy_status)
  end

end

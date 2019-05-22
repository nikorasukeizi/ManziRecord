class BuyInfosController < ApplicationController

  before_action :require_admin, only: [:index, :show, :edit, :update]

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
      session[:buy_status] = nil
    else
      redirect_to root_path
    end
    session[:buy_auth] = false
  end

  def index
      @buyinfos = BuyInfo.all

      
      @buyinfos.each do |buyinfo|
        @buy_items = buyinfo.buy_items
      

      @total_price = 0
      @buy_items.each do |buy_item|
        @total_price = @total_price + buy_item.buy_count * buy_item.price
      end
      end

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

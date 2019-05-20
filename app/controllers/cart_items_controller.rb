class CartItemsController < ApplicationController

  def create
    if user_signed_in?
    	cart_item = current_user.cart_items.build(item_id: params[:item_id], buy_count: params[:cart_item][:buy_count])
    	cart_item.save
    	redirect_to users_cart_path
    else
      session[:carts] = {}
      session[:cart]
    end
  end

  def update
    cart_item = CartItem.find_by(user_id: current_user, item_id: params[:item_id])
    cart_item.update(cart_item_params)
    redirect_to users_cart_path
  end

  def destroy
  	cart_item = CartItem.find_by(item_id: params[:item_id], user_id: current_user.id)
  	cart_item.destroy
  	redirect_to users_cart_path
  end



  private


  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id, :buy_count)
  end

end

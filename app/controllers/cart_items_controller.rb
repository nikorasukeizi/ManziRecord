class CartItemsController < ApplicationController

  def create
    if user_signed_in?
      cart = CartItem.find_by(user_id: current_user.id, item_id: params[:item_id])
      if cart
        cart.buy_count += params[:cart_item][:buy_count].to_i
        cart.save
      else
        cart_item = current_user.cart_items.build(item_id: params[:item_id], buy_count: params[:cart_item][:buy_count])
        cart_item.save
      end
    else
      session[:cart][params[:item_id]] = Item.find(params[:item_id])
      session[:cart][params[:item_id]].store(buy_count: params[:cart_item][:buy_count])
    end
    redirect_to users_cart_path
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

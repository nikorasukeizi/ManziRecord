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
        item = { buy_count: params[:cart_item][:buy_count].to_i }
        session[:cart][params[:item_id]] = item
    end
    redirect_to users_cart_path
  end

  def update
    if user_signed_in?
      cart_item = CartItem.find_by(user_id: current_user, item_id: params[:item_id])
      cart_item.update(cart_item_params)
    else
        session[:cart][params[:item_id]]["buy_count"] = params["buy_count"].to_i
    end
    redirect_to users_cart_path
  end

  def destroy
    if user_signed_in?
    	cart_item = CartItem.find_by(item_id: params[:item_id], user_id: current_user.id)
    	cart_item.destroy
    else
      session[:cart].delete(params[:item_id])
    end
    	redirect_to users_cart_path
  end



  private


  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id, :buy_count)
  end

end

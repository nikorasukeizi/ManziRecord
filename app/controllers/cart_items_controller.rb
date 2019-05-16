class CartItemsController < ApplicationController

  def create
  	cart_item = curent_user.cart_items.build(item_id: params[:item_id])
  	cart_item.save
  	redirect_to user_cart_path(current_user)
  end

  def edit
  end

  def destroy
  	cart_item = Cart_item.find_by(item_id: params[:item_id], user_id: current_user.id)
  	cart_item.destroy
  	redirect_to user_cart_path(current_user)
  end
end

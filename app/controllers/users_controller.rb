class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def buy_history
  end

  def withdraw_view
  end

  def index
  end

  def cart_show
    @user = current_user
  end

  def buy
    @select = [:select]
    @buy_info = BuyInfo.new
  end

  def buy_confirm
    if params[:select] == true
        @buy_info = BuyInfo.new(addressee: "#{current_user.first_name}+#{current_user.last_name}", delivery_postcode: current_user.postcode, delivery_address: current_user.address)
    else
        @buy_info = BuyInfo.new(params[:addressee, :delivery_postcode, :delivery_address])
    end
    @buy_info.payments = params[:payments]
    @buy_info.buy_status = 0 #ステータスに「受付」を代入(buy_infoモデルのenumの記述見て！)
    @buy_info.save
    redirect_to users_buy_confirm_path
  end

  def update
  end

  def withdraw
  end

  def cart_update
  end

  def cart_destroy
  end

  def cart
  end

end

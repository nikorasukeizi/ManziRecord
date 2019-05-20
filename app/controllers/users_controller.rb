class UsersController < ApplicationController

before_action :correct_user, only:[:show, :edit, :update, :withdraw]
before_action :require_admin, only:[:index]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def buy_history
      @user = User.find(params[:id])
      @buy_infos = @user.buy_infos.order('created_at desc')
  end

  def withdraw_view

  end

  def index
    @users = User.all
  end

  def cart_show
    if user_signed_in?
        @user = current_user
    end
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
    @user = User.find(params[:id])
    if @user.update_without_current_password(user_params)
      sign_in @user, bypass: true
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def withdraw
    # エンドユーザの場合の処理
    if current_user.admin == false
      user = User.find(current_user.id)
      if user.valid_password?(params[:user][:password])
        current_user.status = false
        current_user.update(user_params)
        redirect_to root_path
      else
        render :withdraw_view
      end
    # adminの場合の処理
    else
      user = User.find(params[:id])
      user.update(status: false)
      redirect_to users_path
    end
  end

  def cart_create
      cart = CartItem.new(cart_item_params)
      cart.user_id = current_user.id
      cart.item_id = Item.find(params[:id])
      cart.save
      redirect_to users_cart_path(user.id)
  end

  def cart_update
  end

  def cart_destroy
  end


  def cart
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :rubi_first_name, :rubi_last_name, :birthdate, :postcode, :address, :tel, :password, :password_confirmation, :email, :status, :admin)
  end

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id, :buy_count)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user && current_user.admin == false
      redirect_to user_path(current_user.id)
    end
  end

  def require_admin
    if current_user.admin == false
      redirect_to user_path(current_user.id)
    end
  end

end

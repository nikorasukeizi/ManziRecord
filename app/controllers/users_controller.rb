class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def buy_history
  end

  def withdraw_view

  end

  def index
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
    if current_user.password_confirmation == current_user.password
       current_user.status = 'false'
       current_user.update(user_params)
       current_user.save
       redirect_to root_path
    else
       render :withdraw_view
    end

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

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

end

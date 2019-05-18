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
    @users = User.all
  end

  def cart_show
  end

  def buy
  end

  def buy_confirm
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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :rubi_first_name, :rubi_last_name, :birthdate, :postcode, :address, :tel, :password, :password_confirmation, :email, :status, :admin)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

end

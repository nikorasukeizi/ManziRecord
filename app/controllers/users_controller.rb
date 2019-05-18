class UsersController < ApplicationController

before_action :correct_user, only:[:show, :edit, :cart_show, :buy, :buy_confirm, :update, :withdraw, :cart_update, :cart_destroy]
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

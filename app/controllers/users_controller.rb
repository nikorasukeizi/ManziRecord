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

  def index
    @users = User.page(params[:page]).per(10)
  end

  def cart_show
    if user_signed_in?
      @user = current_user
      unless session[:cart] == {}
        session[:cart].each do |key, value|
          cart = CartItem.find_by(user_id: current_user.id, item_id: key.to_i)
          if cart
            cart.update(buy_count: value["buy_count"])
          else
            cart_new = CartItem.new(user_id: current_user.id, item_id: key.to_i, buy_count: value["buy_count"])
            cart_new.save
          end
        end
        session[:cart] = {} #セッション初期化
      end
    end
  end

  def buy
    if user_signed_in?
      session[:buy_auth] = true
      @user = current_user
      @select = [:select]
      @buy_info = BuyInfo.new
    else
      flash[:danger] = '卍 購入手続きに進むには、会員登録が必要です 卍'
      redirect_to new_user_session_path
    end
  end

  def buy_confirm
    @user = current_user
    if session[:buy_auth] == true
       session[:buy_status] = params[:buy_info]  unless params[:buy_info] == nil
      if session[:buy_status][:select] == "0" #登録先が選択された場合
          @buy_info = BuyInfo.new(addressee: "#{current_user.last_name}#{current_user.first_name}", delivery_postcode: current_user.postcode,
                                  delivery_address: current_user.address, payments: session[:buy_status][:payments], user_id: current_user.id)
      else
          @buy_info = BuyInfo.new(buy_info_params)
      end
      @buy_info.buy_status = 0 #ステータスに「受付」を代入
      @buy_info_new = BuyInfo.new
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_without_current_password(user_params)
      sign_in @user, bypass: true
      flash[:success] = 'ユーザ情報を編集しました'
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
        flash[:danger] = '卍卍卍 退会しました 卍卍卍'
        redirect_to root_path
      else
        flash.now[:danger] = '入力されたパスワードが違います'
        render :withdraw_view
      end
    # adminの場合の処理
    else
      user = User.find(params[:id])
      user.update(status: false)
      redirect_to users_path
    end
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
    if user_signed_in?
      user = User.find(params[:id])
      if user != current_user && current_user.admin == false
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to root_path
    end
  end

  def require_admin
    if user_signed_in?
      if current_user.admin == false
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to root_path
    end
  end

  def buy_info_params
    params.require(:buy_info).permit(:user_id, :payments, :addressee, :delivery_postcode, :delivery_address, :buy_status)
  end

end



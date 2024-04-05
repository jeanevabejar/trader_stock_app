class PagesController < ApplicationController
  before_action :require_admin, only: [ :admin, :transactions ]
  before_action :require_user, only: :users
  before_action :authenticate_admin!, only: [ :edit_user, :update_user ]

  def admin
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to pages_admin_path, notice: 'User was successfully updated.'
    else
      render :edit_user
    end
  end

  def show_user
    @user = User.find(params[:id])
  end

  def transactions
    @transactions = Transaction.all
  end

  def home
    no_turning_back
  end

  def users
  @client = clients
  end

  private

  def require_admin
    unless admin_signed_in?
      flash[:notice] = "You need to be an admin to access admin pages."
      redirect_to pages_user_path
    end
  end

  def require_user
    unless user_signed_in?
      flash[:notice] = "The page you're trying to access is for Traders only."
      redirect_to pages_admin_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
 end

  def no_turning_back
    if admin_signed_in?
      redirect_to pages_admin_path
    elsif user_signed_in?
      redirect_to pages_user_path
    end
  end
end

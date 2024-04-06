class PagesController < ApplicationController
  before_action :require_admin, only: [ :admin, :transactions ]
  before_action :require_user, only: :users
  before_action :set_user, only: [:edit_user, :update_user, :show_user]
  before_action :authenticate_admin!, only: [ :edit_user, :update_user ]
  before_action :authenticate_user!, only: :users


  def admin
    @users = User.all
  end

  def edit_user
  end

  def update_user
    if @user.update(user_params)
      redirect_to pages_admin_path, notice: 'User was successfully updated.'
    else
      render :edit_user
    end
  end

  def show_user
  end

  def transactions
    @transactions = Transaction.all
  end

  def home
    no_turning_back
  end

  def users
    @user = current_user
    @client = clients
    @search = search

  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end

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
      redirect_to pages_user_path(current_user)
    end
  end
end

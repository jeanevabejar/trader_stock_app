class PagesController < ApplicationController
  before_action :require_admin, only: [ :admin, :transactions ]
  before_action :require_user, only: :users

  def admin
    @users = User.all
  end

  def transactions
    @transactions = Transaction.all
  end

  def home
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
end

class PagesController < ApplicationController
  before_action :require_admin, only: [ :admin, :transactions, :edit_user, :update_user ]
  before_action :require_user, only: :users
  before_action :set_user, only: [:edit_user, :update_user, :show_user ]
  before_action :search, only: [:users, :transactions ]

  def admin
    @users = User.all.order("id")
    @to_be_approved = @users.confirmed_users
    @to_be_confirmed = @users.to_confirmed_users
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new
    user_service = UserService.new(@user)
    if user_service.create(user_params)
      redirect_to pages_admin_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit_user
  end

  def update_user
    user_service = UserService.new(@user)
    if user_service.update(user_params)
      redirect_to pages_admin_path, notice: 'User was successfully updated.'
    else
      render :edit_user, notice: 'Error updating User.'
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
    @data = @clients.ref_data_symbols()
    if @search_query.present?
      @price_data = @clients.price(@search_query)
    else
      @price_data = []
    end
  end

  private

  def search
    @clients = clients
    @search_query = params[:data]
  end

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
    params.require(:user).permit(:email, :password, :password_confirmation, :is_approved)
 end

  def no_turning_back
    if admin_signed_in?
      redirect_to pages_admin_path
    elsif user_signed_in?
      redirect_to pages_user_path
    end
  end
end

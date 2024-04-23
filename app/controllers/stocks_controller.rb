class StocksController < ApplicationController
    
  def profile
    @stocks = current_user.stocks.order(total_share: :desc )
    @transactions = current_user.transactions.order(created_at: :desc )
    @clients = clients
  
  end
  
  

    def new_deposit
        @user = current_user
    end

    def deposit
        @user = current_user
        new_balance = @user.balance + transaction_params[:amount].to_d
        if @user.update(balance: new_balance)
          redirect_to profile_path, notice: 'Balance updated successfully'
        else
          redirect_to profile_path, alert: 'Unsuccessful Deposit'
        end
    end

    private

    def transaction_params
    params.require(:user).permit(:amount)
    end
end

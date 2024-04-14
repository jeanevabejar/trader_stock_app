class TransactionsController < ApplicationController

def new_transaction
    @transaction = current_user.transactions.new()
    @clients = clients
    @symbol = cookies[:data_symbol]
    if @symbol.present?
        @price_data = @clients.price(@symbol)
    end 
    
end

def create_transaction
    # Transaction.buy(current_user, transaction_params)
    @transaction = current_user.transactions.create(transaction_params)
    if @transaction.save
        redirect_to pages_user_path
    else
        render :new_transaction
    end
    
end

def buy
    Transaction.buy(current_user, transaction_params)
    redirect_to pages_user_path
rescue ActiveRecord::RecordInvalid
    render :new_transaction
end

def sell
    Transaction.sell(current_user, transaction_params)
    redirect_to pages_user_path
rescue ActiveRecord::RecordInvalid
    render :new_transaction
end

private

def transaction_params
    params.require(:transaction).permit(:price, :share, :amount, :is_buy, :stock_name, :amount)
end
end

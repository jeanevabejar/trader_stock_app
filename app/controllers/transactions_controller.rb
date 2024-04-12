class TransactionsController < ApplicationController

def new_transaction
    @transaction = current_user.transactions.new()
end

def create_transaction
    # Transaction.buy(current_user, transaction_params)
    @transaction = current_user.transactions.create(transaction_params)
    if @transaction.save
        redirect_to pages_user_path
    else
        puts @transaction.errors.full_messages
        render :new_transaction
    end
    
end

private

def transaction_params
    params.require(:transaction).permit(:price, :share, :amount, "is_buy?", :stock_name)
end
end

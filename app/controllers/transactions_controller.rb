class TransactionsController < ApplicationController

def buy_transaction
    @transaction = current_user.transactions.new()
    @clients = clients
    @symbol = cookies[:data_symbol]
    if @symbol.present?
        @price_data = @clients.price(@symbol)
    end   

end

def sell_transaction
    @transaction = current_user.transactions.new()
    @clients = clients
    @stock_list = current_user.stocks.pluck(:stock_symbol).join(",")
    @symbol = cookies[:data_symbol]
    if @symbol.present?
        @price_data = @clients.price(@symbol)
        @stocks = current_user.stocks.find_by(stock_symbol: @symbol)
    end 
end


def buy
    Transaction.buy(current_user, transaction_params)
    redirect_to pages_user_path
rescue ActiveRecord::RecordInvalid
    redirect_to pages_user_path, notice: "error in selling"
end
  

def sell
    Transaction.sell(current_user, transaction_params)
    redirect_to pages_user_path
rescue ActiveRecord::RecordInvalid
    redirect_to pages_user_path, notice: "error in selling"
end

private

def transaction_params
    params.require(:transaction).permit(:price, :share, :amount, :is_buy, :stock_name, :amount)
end
end

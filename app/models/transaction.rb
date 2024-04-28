class Transaction < ApplicationRecord
  belongs_to :user

  validates :share, numericality: {greater_than: 0} 

  def self.buy(current_user, transaction_params)
    ActiveRecord::Base.transaction do 
      transaction = current_user.transactions.build(transaction_params)
      total_amount = transaction_params[:share].to_i * transaction_params[:price].to_f
      transaction.save!
      current_user.balance -= total_amount
      current_user.save!

      stock = current_user.stocks.find_or_initialize_by(stock_symbol: transaction_params[:stock_name])
      stock.total_share += transaction_params[:share].to_i
      stock.save!

    end
  end

  def self.sell(current_user, transaction_params)
    ActiveRecord::Base.transaction do 
      transaction = current_user.transactions.build(transaction_params)
      total_amount = transaction_params[:share].to_i * transaction_params[:price].to_f
      transaction.save!
      current_user.balance += total_amount
      current_user.save!

      stock = current_user.stocks.find_or_initialize_by(stock_symbol: transaction_params[:stock_name])
      stock.total_share -= transaction_params[:share].to_i
      if stock.total_share <= 0
        stock.destroy
      else
        stock.save!
      end
    end
  end
end

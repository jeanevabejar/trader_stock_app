class Transaction < ApplicationRecord
  belongs_to :user

  def self.buy(current_user, transaction_params)
    ActiveRecord::Base.transaction do 
      transaction = current_user.transactions.build(transaction_params)
      transaction.save!
    end
  end

  def self.sell(current_user, transaction_params)
    ActiveRecord::Base.transaction do 
      transaction = current_user.transactions.build(transaction_params)
      transaction.save!
    end
  end
end

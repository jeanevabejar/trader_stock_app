class RenameIsBuyInTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :is_buy?, :is_buy
  end
end

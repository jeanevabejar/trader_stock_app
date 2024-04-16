class ChangePricePrecisionInTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :price, :decimal, precision: 10, scale: 2, default: 0.0
  end
end

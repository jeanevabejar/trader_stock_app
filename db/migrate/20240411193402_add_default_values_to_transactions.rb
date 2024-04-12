class AddDefaultValuesToTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column_default :transactions, :price, from: nil, to: 0
    change_column_default :transactions, :share, from: nil, to: 0
  end
end

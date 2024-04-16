class ChangeBalancePrecisionInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :balance, :decimal, precision: 10, scale: 2, default: 0.00
  end
end

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :stock_name
      t.boolean :is_buy?
      t.integer :share
      t.decimal :price
      t.decimal :amount

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :payment_type
      t.date :date
      t.integer :status
      t.decimal :total
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

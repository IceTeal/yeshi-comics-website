class RemovePhoneFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :phone, :string
  end
end

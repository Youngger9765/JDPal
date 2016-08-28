class ChangeContactInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :contacted, :status
    change_column :orders, :status, :string
  end
end

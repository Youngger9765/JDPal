class AddMoreInfoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :country, :string
    add_column :orders, :language, :string
    add_column :orders, :people_count, :integer
    add_column :orders, :request_days, :integer
    add_column :orders, :purpose, :string
    add_column :orders, :others, :text
  end
end

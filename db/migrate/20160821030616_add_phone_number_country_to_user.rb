class AddPhoneNumberCountryToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :country, :string

    add_index :users, :phone_number
    add_index :users, :country
  end
end

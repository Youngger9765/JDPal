class AddGenderBirthdayToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :birthday, :date
    add_column :orders, :gender, :string

    add_index :orders, :birthday
    add_index :orders, :gender
  end
end

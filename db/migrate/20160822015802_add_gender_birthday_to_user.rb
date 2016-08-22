class AddGenderBirthdayToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :gender, :string

    add_index :users, :birthday
    add_index :users, :gender
  end
end

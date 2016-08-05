class AddFbDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nick_name, :string
    add_column :users, :facebook_url, :string
    add_column :users, :head_shot, :string
  end
end

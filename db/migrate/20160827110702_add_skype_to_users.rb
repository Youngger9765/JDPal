class AddSkypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skype_id, :string
    add_column :orders, :skype_id, :string
  end
end

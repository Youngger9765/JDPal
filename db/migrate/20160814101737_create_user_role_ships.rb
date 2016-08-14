class CreateUserRoleShips < ActiveRecord::Migration
  def change
    create_table :user_role_ships do |t|
      t.integer   :user_id
      t.integer   :role_id

      t.timestamps null: false
    end

    add_index :user_role_ships, :user_id
    add_index :user_role_ships, :role_id
  end
end

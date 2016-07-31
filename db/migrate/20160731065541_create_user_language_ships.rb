class CreateUserLanguageShips < ActiveRecord::Migration
  def change
    create_table :user_language_ships do |t|
      t.integer   :user_id
      t.integer   :language_id
      t.string    :level

      t.timestamps null: false
    end

    add_index :user_language_ships, :user_id
    add_index :user_language_ships, :language_id
  end
end

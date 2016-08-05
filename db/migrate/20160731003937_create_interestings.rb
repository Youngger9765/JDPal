class CreateInterestings < ActiveRecord::Migration
  def change
    create_table :interestings do |t|
      t.integer   :user_id
      t.integer   :interest_id

      t.timestamps null: false
    end

    add_index :interestings, :user_id
    add_index :interestings, :interest_id
  end
end

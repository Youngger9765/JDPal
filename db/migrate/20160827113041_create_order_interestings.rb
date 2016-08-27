class CreateOrderInterestings < ActiveRecord::Migration
  def change
    create_table :order_interestings do |t|
      t.integer   :order_id
      t.integer   :interest_id

      t.timestamps null: false

    end
    add_index :order_interestings, :order_id
    add_index :order_interestings, :interest_id
  end
end

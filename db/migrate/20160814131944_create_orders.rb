class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer   :user_id
      t.integer   :tour_guide_id
      t.boolean   :finished
      t.boolean   :contacted
      t.date      :user_prefer_date
      t.date      :final_date
      t.string    :user_prefer_place
      t.string    :final_place
      t.text      :note

      t.timestamps null: false
    end
  end
end

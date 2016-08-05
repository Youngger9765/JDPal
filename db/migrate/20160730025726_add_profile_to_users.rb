class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description_English, :text
    add_column :users, :description_Chinese, :text
    add_column :users, :profession, :string
    add_column :users, :availability, :string
    add_column :users, :travel_footprints, :string
    add_column :users, :familiar_areas, :string
  end
end

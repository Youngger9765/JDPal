class RenameSkypeIdToUsers < ActiveRecord::Migration
  def change
    rename_column :orders, :skype_id, :social_media_id
    rename_column :users, :skype_id, :social_media_id
  end
end

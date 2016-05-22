class AddIndexUserIdAndNameToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_index :playlists, [:user_id, :name], :unique => true
  end
end

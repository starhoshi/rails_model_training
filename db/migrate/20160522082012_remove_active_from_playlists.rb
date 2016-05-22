class RemoveActiveFromPlaylists < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists, :active, :boolean
  end
end

class AddActiveToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :active, :boolean
  end
end

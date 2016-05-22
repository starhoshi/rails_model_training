class AddActiveToPlaylistSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :playlist_songs, :active, :boolean
  end
end

class CreateSongHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :song_histories do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.references :device, foreign_key: true
      t.string :media_id
      t.string :track_source
      t.string :album
      t.integer :duration
      t.string :genre
      t.string :album_art_uri
      t.integer :track_number
      t.integer :num_tracks
      t.date :recorded_at
      t.point :point
      t.float :accuracy
      t.float :altitude
      t.string :record_type

      t.timestamps
    end
  end
end

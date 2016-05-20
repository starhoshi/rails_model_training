class CreateSongTotalCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :song_total_counts do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :skip_count
      t.integer :play_count

      t.timestamps
    end
  end
end

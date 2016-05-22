class RankingController < ApplicationController
  before_action :authenticate

  def songs
    @songs = SongTotalCount.joins(:user, :song).select("song_total_counts.*, songs.*").where(user_id: @user.id).order(play_count: :desc)
  end

  def artists
    @artists = SongTotalCount.joins(:user, :song)
      .select('songs.artist, SUM(song_total_counts.play_count) AS play_count, SUM(song_total_counts.skip_count) AS skip_count')
      .where(user_id: @user.id)
      .group('songs.artist')
      .order('play_count DESC')
  end
end

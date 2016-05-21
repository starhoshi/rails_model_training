class RankingController < ApplicationController
  before_action :authenticate

  def songs
    @songs = SongTotalCount.joins(:user, :song).select("song_total_counts.*, songs.*").where(user_id: @user.id).order(play_count: :desc)
  end

  def artist
    @songs = SongTotalCount.joins(:user, :song).select("song_total_counts.*, songs.*").where(user_id: @user.id).order(play_count: :desc)
  end
end

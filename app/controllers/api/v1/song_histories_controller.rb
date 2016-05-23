class Api::V1::SongHistoriesController < Api::ApiController
  before_action :authenticate
  # before_action :set_song_history, only: [:index, :edit, :update, :destroy]

  # GET /song_histories
  # GET /song_histories.json
  def index
    @song_total_count = SongTotalCount.joins(:song, :user).select('songs.*, song_total_counts.*').where(songs: {title: params[:title], artist: params[:artist]}, users: {id: @user.id}).first
    if @song_total_count.blank?
      return
    end

    @first = SongDayCount.where(song_id: @song_total_count.song.id, user_id: @user.id).order(:date).first

    where_params = {}
    where_params[:user_id] = @user.id
    where_params[:song_id] = @song_total_count.song.id
    @to = params[:to] || Date.today.to_s
    where_date = params[:from].blank? ? ["date <= ?", @to] : {:song_day_counts => {date: [params[:from]..@to]}}

    details = []
    SongDayCount.joins(:song, :user).where(where_params).where(where_date).order(:date).each.with_index do |song_day_count, index|
      if index == 0
        @first_date = song_day_count.date
      end
      details[@to.to_date - song_day_count.date] = {:skip_count => song_day_count.skip_count, :play_count => song_day_count.play_count, :date => song_day_count.date}
    end

    # from がある場合、その from の日から to の日の配列を作る
    if !params[:from].blank?
      ((@first_date || @to.to_date + 1) - params[:from].to_date).to_i.times do
        details.push(nil)
      end
    end
    p @details = details.reverse
  end

  # GET /song_histories/1
  # GET /song_histories/1.json
  def show
    p params
  end

  # POST /song_histories
  # POST /song_histories.json
  def create
    @song = Song.find_or_create_from_song(song_history_params[:title], song_history_params[:artist])
    @device = Device.find_or_create(@user.id, song_history_params[:device][:os], song_history_params[:device][:model])
    @song_history = SongHistory.create_by_params(song_history_params,@user.id, @device.id, @song.id)

    respond_to do |format|
      if @song_history.save
        SongDayCount.update_or_create_by_song_history(@song_history)
        SongTotalCount.update_or_create_by_song_history(@song_history)
        format.html { redirect_to @song_history, notice: 'Song history was successfully created.' }
        format.json { render :nothing => true, status: :created}
      else
        format.html { render :new }
        format.json { render json: @song_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_histories/1
  # PATCH/PUT /song_histories/1.json
  def update
    respond_to do |format|
      if @song_history.update(song_history_params)
        format.html { redirect_to @song_history, notice: 'Song history was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_history }
      else
        format.html { render :edit }
        format.json { render json: @song_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_histories/1
  # DELETE /song_histories/1.json
  def destroy
    @song_history.destroy
    respond_to do |format|
      format.html { redirect_to song_histories_url, notice: 'Song history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song_history
    @song_history = SongHistory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_history_params
    params.permit(:media_id, :track_source, :duration, :genre, :album, :album_art_uri, :track_number, :num_tracks, :recorded_at, :latitude, :longitude, :accuracy, :altitude, :record_type, {:device => [:model, :os]}, :artist, :title)
  end
end

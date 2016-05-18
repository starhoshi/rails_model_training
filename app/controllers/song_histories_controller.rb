class SongHistoriesController < ApplicationController
  before_action :set_song_history, only: [:show, :edit, :update, :destroy]

  # GET /song_histories
  # GET /song_histories.json
  def index
    @song_histories = SongHistory.all
  end

  # GET /song_histories/1
  # GET /song_histories/1.json
  def show
  end

  # GET /song_histories/new
  def new
    @song_history = SongHistory.new
  end

  # GET /song_histories/1/edit
  def edit
  end

  # POST /song_histories
  # POST /song_histories.json
  def create
    @song_history = SongHistory.new(song_history_params)

    respond_to do |format|
      if @song_history.save
        format.html { redirect_to @song_history, notice: 'Song history was successfully created.' }
        format.json { render :show, status: :created, location: @song_history }
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
      params.require(:song_history).permit(:user_id, :song_id, :device_id, :media_id, :track_source, :album, :duration, :genre, :album_art_uri, :track_number, :num_tracks, :recorded_at, :point, :accuracy, :altitude, :record_type)
    end
end

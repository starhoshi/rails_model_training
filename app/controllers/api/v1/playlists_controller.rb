class Api::V1::PlaylistsController < Api::ApiController
  before_action :authenticate
  before_action :set_playlist, only: [:update_songs, :update_name, :show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.where(user_id: @user.id, active: true)
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @playlist_songs = PlaylistSong.joins(:song).select('songs.*, playlist_songs.*')
    .where(playlist_id: params[:id], active: true)
  end

  # POST /playlists
  # POST /playlists.json
  def create
    p playlist_params[:songs]
    @playlist = Playlist.create_by_params(playlist_params, @user.id)

    if @playlist.save
      playlist_params[:songs].each do |song_params|
        song = Song.find_or_create_from_song(song_params[:title], song_params[:artist])
        playlist_song = PlaylistSong.create_by_params(@playlist.id, song.id)
      end
      render :create, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    p params
    if params[:name]
      @playlist.name = params[:name]
    end

    if @playlist.save
      PlaylistSong.where(playlist_id: @playlist.id).update_all(active: false)
      playlist_params[:songs].each do |song_params|
        song = Song.find_or_create_from_song(song_params[:title], song_params[:artist])
        playlist_song = PlaylistSong.create_by_params(@playlist.id, song.id)
      end
      render :create, status: :ok
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.active = false
    @playlist.save
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.joins(:user).where(id: params[:id], users: {id:@user.id}, active: true).last
    if @playlist.nil?
      render_404
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.permit(:name, :songs => [:title, :artist])
  end
end

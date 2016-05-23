class Api::V1::Playlists::NameController < Api::V1::PlaylistsController
  before_action :authenticate
  before_action :set_playlist, only: [:update]

  def update
    @playlist.name = params[:name]
    if @playlist.save
      render :update, status: :ok
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end
end

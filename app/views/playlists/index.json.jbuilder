json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :user_id, :name, :active
  json.url playlist_url(playlist, format: :json)
end

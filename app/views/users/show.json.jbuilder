json.(@user, :id, :created_at, :updated_at)
json.profile @profile do |profile|
  json.(profile, :created_at, :updated_at, :uid, :name, :nickname, :url, :image_url, :description)
end

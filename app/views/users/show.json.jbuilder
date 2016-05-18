json.(@user, :id, :created_at, :updated_at)
json.profile do
  json.(@profile, :id, :created_at, :updated_at, :uid,
  :name, :nickname, :url, :image_url, :description)
end

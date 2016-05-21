json.(@user, :id, :created_at, :updated_at)
json.profiles @profile do |profile|
  json.(profile, :id, :created_at, :updated_at, :provider, :uid, :name, :nickname, :url, :image_url, :description)
end
json.devices @device do |device|
  json.(device, :id, :created_at, :updated_at, :os, :model)
end

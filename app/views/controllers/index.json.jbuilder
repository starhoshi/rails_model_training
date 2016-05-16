json.array!(@controllers) do |controller|
  json.extract! controller, :id, :me
  json.url controller_url(controller, format: :json)
end

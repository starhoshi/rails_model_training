json.array!(@devices) do |device|
  json.extract! device, :id, :user_id, :os, :model, :push_token
  json.url device_url(device, format: :json)
end

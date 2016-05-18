json.array!(@push_tokens) do |push_token|
  json.extract! push_token, :id, :user_id, :os, :push_token
  json.url push_token_url(push_token, format: :json)
end

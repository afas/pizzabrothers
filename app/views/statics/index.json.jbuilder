json.array!(@statics) do |static|
  json.extract! static, :id, :title, :body, :short_url
  json.url static_url(static, format: :json)
end

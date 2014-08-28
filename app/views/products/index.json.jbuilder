json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :photo, :price, :price_classic, :price_big, :category_id
  json.url product_url(product, format: :json)
end

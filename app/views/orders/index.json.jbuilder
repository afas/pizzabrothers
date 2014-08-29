json.array!(@orders) do |order|
  json.extract! order, :id, :name, :phone, :address, :email, :cash_from, :comment, :order_status_id, :latitude, :longitude
  json.url order_url(order, format: :json)
end

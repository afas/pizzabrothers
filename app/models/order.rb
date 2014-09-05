class Order < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode

  has_many :order_items
  has_many :products, :through => :order_items

  scope :news, -> { where(order_status_id: 0)}
  scope :closed, -> { where(order_status_id: 3)}


  def add_order_items_from_cart(cart)
    cart.items.each do |item|
      OrderItem.create_from_cart_item(item, self.id)
    end
  end

  def products_price
    order_items.sum { |item| item.price * item.product_count }
  end

  def delivery_price
    300.to_int
  end

  def total_price
    products_price.to_int + delivery_price.to_int
  end

end

class OrderItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  def self.create_from_cart_item(cart_item, order_id)
    order_item = self.new()
    order_item.order_id = order_id
    order_item.product_id = cart_item.product.id
    order_item.product_count = cart_item.product_count
    order_item.product_size = cart_item.product_size
    order_item.save
  end

  def price
    case self.product_size
      when 0
        return self.product.price
      when 1
        return self.product.price_classic
      when 2
        return self.product.price_big
    end
  end

end

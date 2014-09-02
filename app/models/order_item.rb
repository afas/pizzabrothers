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
    # return order
  end

  def price
    case self.product_size
      when 1
        self.product.price_classic
      when 2
        self.product.price_big
      else
        self.product.price
    end
  end

end

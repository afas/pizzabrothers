class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def products_count
    @items.size
  end

  def add_product(product, size_id)
    current_item = @items.detect { |item| item.product == product and item.product_size == size_id }
    unless current_item.nil?
      current_item.increment_count
    else
      current_item = CartItem.new(product, size_id)
      @items << current_item
    end
    current_item
  end

  def remove_product(product, size_id)
    current_item = @items.detect { |item| item.product == product and item.product_size == size_id }
    if current_item && current_item.count == 1
      @items.delete_if { |item| item.product == product and item.product_size == size_id }
      current_item = nil
    else
      current_item.set_count(current_item.count - 1)
    end
    current_item

    # current_item = @items.detect { |item| item.product == product and item.product_size == size_id }
    # unless current_item.nil?
    #   current_item.increment_count
    # else
    #   current_item = CartItem.new(product, size_id)
    #   @items << current_item
    # end
    # current_item
  end

  # def set_count(product_count, product, size_id)
  #   current_item = @items.detect { |item| item.product == product and item.product_size == size_id }
  #   if current_item
  #     size_to_product = SizeToProduct.find_by_product_id_and_size_id(product.id, size_id)
  #     product_count = size_to_product.product_count if size_to_product && product_count > size_to_product.product_count && size_id != 888
  #
  #     current_item.set_count(product_count)
  #     if current_item.product_count == 0
  #       @items.delete current_item
  #       current_item = nil
  #     end
  #   end
  #   current_item
  # end

  def update_size(product_count, product, size_id)
    current_item = @items.detect { |item| item.product.eql?(product) && item.product_count == product_count && item.initial_size == 55 }
    current_item.set_size(size_id) unless current_item.nil?
    current_item
  end

  def products_price
    @items.sum { |item| item.sum }
  end

  def delivery_price
    300.to_f
  end

  def total_price
    products_price.to_f + delivery_price.to_f
  end

end

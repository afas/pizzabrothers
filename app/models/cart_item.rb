class CartItem
  attr_reader :product, :product_count, :product_size, :initial_size

  def initialize(product, size_id)
    @product = product
    @product_size = size_id.to_i
    @initial_size = size_id.to_i
    @product_count = 1
  end

  def increment_count
    @product_count += 1
  end

  def set_count(product_count)
    @product_count = product_count.to_i
  end

  def set_size(size_id)
    @product_size = size_id
  end

  def initial_size
    @initial_size
  end

  def name
    @product.name
  end

  def product_id
    @product.id
  end

  def size_id
    @product_size
  end

  def price
    case @product_size
      when 1
        @product.price_classic
      when 2
        @product.price_big
      else
        @product.price
    end
  end

  def size
    ProductSize.by_code(@product_size)
  end

  def count
    @product_count
  end

  def sum
    self.price * @product_count
  end

end
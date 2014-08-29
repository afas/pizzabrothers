class CartController < ApplicationController
  def my_cart
    @order = Order.new
  end

  def pizza_builder
  end
end

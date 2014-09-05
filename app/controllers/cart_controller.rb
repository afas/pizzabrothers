#encoding: utf-8
class CartController < ApplicationController
  def my_cart
    @order = Order.new
  end

  def add_product
    product = Product.find(params[:product_id].to_i)
    @cart_item = @cart.add_product(product, params[:size_id].to_i)
    @cart_item_id = "#{@cart_item.product_id}_#{@cart_item.product_size}"
    render :layout => false
  end

  def remove_product
    @cart_item_id = ""

    product = Product.find(params[:product_id].to_i)
    @cart_item = @cart.remove_product(product, params[:size_id].to_i)

    @cart_item_id = "#{product.id}_#{params[:size_id]}"
    @cart_item_remove = true if @cart_item.nil?

    render :layout => false
  end

  def empty
    session[:cart] = nil
    render :layout => false
  end

  def pizza_builder
    @product = Product.new
  end

  # def set_count
  #   product = Product.find(params[:product_id].to_i)
  #   @current_item = @cart.set_count(params[:product_count].to_i, product, params[:size_id].to_i)
  #   render :layout => false
  # end

  # def update_size
  #   product = Product.find(params[:product_id].to_i)
  #   @current_item = @cart.update_size(params[:product_count].to_i, product, params[:size_id].to_i)
  #   render :layout => false
  # end
end

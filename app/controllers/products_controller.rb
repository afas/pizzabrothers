#encoding: utf-8
class ProductsController < ApplicationController
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def builder
    @products = Product.builder
    render :by_link
  end

  def by_link
    category_id = Category.code_by_link("/menu/" + params[:link])
    @products = Product.where(category_id: category_id)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.category_id == 10
      size_id = @product.price_big
      case size_id
        when 1
          @product.price_classic = @product.price
          @product.price_big = 0
        when 2
          @product.price_classic = 0
          @product.price_big = @product.price
      end
      @product.price = 0
      respond_to do |format|
        if @product.save
          @cart.add_product(@product, size_id)
          format.html { redirect_to my_cart_path }
        end
      end
    else
      respond_to do |format|
        if @product.save
          format.html { redirect_to Category.link_by_code(@product.category_id), notice: 'Продукт успешно создан.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to Category.link_by_code(@product.category_id), notice: 'Продукт успешно изменен.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to Category.link_by_code(@product.category_id), notice: 'Продукт успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :photo, :price, :price_classic, :price_big, :category_id, :product_order)
  end
end

#encoding: utf-8
class OrdersController < ApplicationController
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.news
  end

  def get_new
    @orders = Order.news
    render layout: false
  end

  def closed
    @orders = Order.closed
  end


  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    @order.cash_from = 0 if @order.summ_price.to_f > @order.cash_from.to_f

    respond_to do |format|
      if @order.save
        @order.add_order_items_from_cart(@cart)

        # if @order.user_create
        #   User.find(@order.user_id).send_reset_password_instructions
        # else
        #   OrderMailer.new_order(@order).deliver
        # end

        session[:cart] = nil

        format.html { redirect_to root_path, notice: 'Ваш заказ принят!' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_url, notice: 'Заказ успешно обновлен.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Заказ успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :phone, :address, :email, :cash_from, :summ_price, :comment, :order_status_id, :latitude, :longitude)
    end
end

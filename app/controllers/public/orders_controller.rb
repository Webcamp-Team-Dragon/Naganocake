class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
    @addresses = Address.all
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new
    # @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    # @payment_method_str = Order.payment_methods.key(@order.payment_method)
  end

  def thanks
  end

  def create
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @address = Address.new(address_params)
    # @address.customer_id = current_customer.id
    if @order.save
      redirect_to orders_thanks_path
    else
      redirect_to request.referer
    end
  end

  def index
    @orders = current_customer.orders.includes(:order_details) # order_detailsも同時に取得
  end

  def show
    @order = current_customer.orders.find_by(id: params[:id])
    if @order.nil?
      redirect_to orders_path, alert: "指定された注文は存在しません。"
    end
  end

  private

  def order_params
  order_params = params.require(:order).permit(:customer_id, :name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost, :status)
  order_params[:payment_method] = order_params[:payment_method].to_i if order_params.key?(:payment_method)
  order_params[:status] = order_params[:status].to_i if order_params.key?(:status)
  order_params.permit(:customer_id, :name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost, :status)
  end

  # def address_params
  #   params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  # end

end

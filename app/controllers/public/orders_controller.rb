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
    @order.shipping_cost = 800
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
       @order_detail = @order.order_details.build(order_detail_params)
       @order_detail.save
      redirect_to orders_thanks_path
    else
      redirect_to request.referer
    end
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
  end

  private

  def order_params
    order_params = params.require(:order).permit(:customer_id, :name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost, :status)
    order_params[:payment_method] = order_params[:payment_method].to_i if order_params.key?(:payment_method)
    order_params[:status] = order_params[:status].to_i if order_params.key?(:status)
    order_params.permit(:customer_id, :name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost, :status)
  end

  def order_detail_params
    order_detail_params = params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status )
    order_detail_params[:making_status] = order_detail_params[:making_status].to_i if order_detail_params.key?(:making_status)
    order_detail_params
  end

  # def address_params
  #   params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  # end

end

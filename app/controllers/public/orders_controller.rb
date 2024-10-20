class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
    @addresses = Address.all
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    # @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    # @order.total_payment
    @payment_method_str = Order.payment_methods.key(@order.payment_method)
  end

  def thanks
  end

  def create
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    # if @order.save
    #   redirect_to public_orders_confirm
    # else
    #   redirect_to request.referer
    # end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_payment, :shipping_cost, :status)
    params.require(:order).permit(:payment_method).transform_values { |value| value.to_i }
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end

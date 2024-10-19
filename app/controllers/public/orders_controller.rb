class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
    @addresses = Address.all
  end

  def confirm
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    if @order.save
      redirect_to public_orders_confirm
    else
      redirect_to request.referer
    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost, :status)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end

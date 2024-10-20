class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address  # ログインしているユーザーの住所
    @addresses = Address.all   # 登録済みの全住所
  end

  def confirm
    @order = Order.new(order_params)
    # ラジオボタンの選択に応じて住所情報を反映
    if @order.address_type == "self"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif @order.address_type == "registered"
      selected_address = Address.find(@order.registered_address)
      @order.name = selected_address.name
      @order.address = selected_address.address
      @order.postal_code = selected_address.postal_code
    elsif @order.address_type == "new"
      @order.name = @order.new_name
      @order.address = @order.new_address
      @order.postal_code = @order.new_postal_code
    end
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

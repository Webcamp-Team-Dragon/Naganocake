class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address  # ログインしているユーザーの住所
    @addresses = Address.all   # 登録済みの全住所
  end

  def confirm
    @order = Order.new(order_params) # フォームから送信されたデータを使用して新しいOrderを作成

    # 「ご自身の住所」を選択した場合
    if params[:order][:address] == current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    # 「登録済住所から選択」を選択した場合
    elsif params[:order][:address].to_i > 0
      selected_address = Address.find(params[:order][:address])
      @order.name = selected_address.name
      @order.address = selected_address.address
      @order.postal_code = selected_address.postal_code

    # 「新しいお届け先」を選択した場合
    elsif params[:order][:address] == "new_address"
      @order.name = params[:order][:new_name]
      @order.address = params[:order][:new_address]
      @order.postal_code = params[:order][:new_postal_code]
    end

    # 支払方法の設定
    @order.payment_method = params[:order][:pay_method]

    # カートの合計金額と送料を設定（カートがある場合）
    @cart_items = current_customer.cart_items
    @order.shipping_cost ||= 0 # もし nil なら 0 を設定
    @order.total_payment = @cart_items.sum(&:total_price) + @order.shipping_cost
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

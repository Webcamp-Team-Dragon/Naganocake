class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  # ※2種類のコントローラーを使用
  # GET	/admin/orders/:id
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end
  # ※2種類のコントローラーを使用
  # PATCH	/admin/orders/:id

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "入金確認"
      @order_details.update_all(making_status: "製作待ち")
    end
      flash[:notice] = "注文詳細の更新に成功しました。"
      redirect_to admin_root_path
	end

  def order_params
    params.require(:order).permit(:status, :order_details)
  end

end
class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  # ※2種類のコントローラーを使用
  # GET	/admin/orders/:id
  def show
  end

  # ※2種類のコントローラーを使用
  # PATCH	/admin/orders/:id
  def update
  end
end

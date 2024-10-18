class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end

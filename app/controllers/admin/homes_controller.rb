class Admin::HomesController < ApplicationController
  # GET	/
  def top
    @orders = Order.all
  end


end

class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new
    redirect_to request.referer
  end

  def update
  end

  def destroy
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name )
  end

end

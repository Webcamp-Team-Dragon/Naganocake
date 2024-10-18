class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end

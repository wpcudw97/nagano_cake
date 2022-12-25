class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.customer_id = current_customer.id
       @address.save
       redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.customer_id = current_customer.id
       @address.update(address_params)
       redirect_to  addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.customer_id = current_customer.id
       @address.destroy
       redirect_to addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end

class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to  comfirm_orders_path
  end

  def index
  end

  def show
  end

   private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment, :status, :created_at)
  end
end

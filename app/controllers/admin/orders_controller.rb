class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to  admin_order_path(order) #パスが違う?
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment, :status, :created_at)
  end
end

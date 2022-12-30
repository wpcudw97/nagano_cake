class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to  admin_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment, :status, :created_at)
  end
end

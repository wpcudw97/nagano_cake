class Admin::OrdersController < ApplicationController
  def show
    # @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to  admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment, :status, :created_at)
  end
end

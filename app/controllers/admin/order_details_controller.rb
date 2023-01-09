class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
    is_updated = true
    if @order_detail.update(order_details_params)
      @order.update(status: 2) if @order_detail.making_status == "production"
      @order_details.each do |order_detail|
        if order_detail.making_status != "completion_of_production"
          is_updated = false
        end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(@order_detail.order)
  end
  #   @order_detail = OrderDetail.find(params[:id])
  #   @order_detail.update(order_details_params)
  #   redirect_to admin_order_path(@order_detail.order)
  # end

  private

  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end

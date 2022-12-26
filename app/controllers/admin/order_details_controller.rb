class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = OrderDetails.find(params[:id])
    @order_details.update(order_details_params)
    redirect_to  admin_order_path(order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end

class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items_count = Item.where(@item_id).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :item_image)
  end
end

class Public::CartItemsController < ApplicationController

  def index
    @cart_items = Item.all
  end

  def create
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :item_image)
  end
end

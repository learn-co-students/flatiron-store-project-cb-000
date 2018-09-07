class LineItemsController < ApplicationController
  before_action :set_item

  def create
    if current_user.current_cart
      cart = current_user.current_cart
      cart.add_item(@item.id)
    else
      cart = current_user.create_current_cart(items: [@item])
      current_user.save
    end
    redirect_to cart_path(current_user.current_cart)
  end

  private

  def item_params
    params.permit(:item_id)[:item_id]
  end

  def set_item
    @item = Item.find_by_id(item_params)
  end
end

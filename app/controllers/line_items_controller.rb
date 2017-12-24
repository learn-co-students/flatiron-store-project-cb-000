class LineItemsController < ApplicationController
  def create
    item = Item.find(item_id)
    if current_user.current_cart
      cart = current_user.current_cart
      cart.add_item(item.id)
    else
      cart = current_user.create_current_cart(items: [item])
      current_user.save
    end
    redirect_to cart_path(current_user.current_cart), alert: "Successfully added #{item.title} to cart"
  end

  private

  def item_id
    params.permit(:item_id)[:item_id].to_i
  end
end

class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      current_user.current_cart.add_item(params[:id])
    else
      current_user.current_cart = current_user.carts.create
      current_user.save
      current_user.current_cart.add_item(params[:id])

    end
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
end

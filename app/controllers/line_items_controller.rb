class LineItemsController < ApplicationController
  def create
    cart = get_cart
    line_item = cart.add_item(params[:item_id])
    line_item.save
    redirect_to cart
  end

  private

  def get_cart
    unless current_user.current_cart
      current_user.build_current_cart
      current_user.save
    end
    current_user.current_cart
  end
end


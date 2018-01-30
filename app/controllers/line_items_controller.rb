class LineItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    current_cart.add_to_cart(params[:item_id])
    redirect_to cart_path(current_cart.id)
  end

  def destroy
    line_item = LineItem.find_by(:id => params[:id])
    current_cart.remove_from_cart(line_item.id)
    redirect_to cart_path(current_cart.id)
  end
end

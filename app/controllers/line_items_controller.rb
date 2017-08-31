class LineItemsController < ApplicationController

  def create
    if !current_user.current_cart
      current_user.create_current_cart
    end

    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      flash[:notice] = "Item was added to cart."
      redirect_to cart_path(current_user.current_cart_id)
    else
      flash[:notice] = "Unable to add item"
      redirect_to root_path
    end
  end

end

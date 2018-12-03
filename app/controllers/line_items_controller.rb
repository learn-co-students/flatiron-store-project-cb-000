class LineItemsController < ApplicationController
  def create
    @user = current_user
    if @user.current_cart.nil?
      @user.new_cart
    end
    @line_item = @user.current_cart.add_item(params[:item_id])
    @line_item.save
    redirect_to cart_path(@user.current_cart)
  end
end

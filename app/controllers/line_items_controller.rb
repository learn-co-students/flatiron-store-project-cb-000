class LineItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if !current_user.current_cart
      current_user.current_cart = Cart.new
      @current_cart = current_user.current_cart
      @current_cart.line_items << LineItem.create(item: @item, quantity: 1)
    else
      @current_cart = current_user.current_cart
      @current_cart.line_items.each do |line_item|
        if line_item.item == @item
          line_item.quantity += 1
          line_item.save
        else
          @current_cart.line_items << LineItem.create(item: @item, quantity: 1)
        end
      end
    end
    redirect_to cart_path(@current_cart)
  end

end

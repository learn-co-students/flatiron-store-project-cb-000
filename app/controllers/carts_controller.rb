class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    @cart.line_items.each{|li|
      @item = Item.find(li.item_id)
      @item.update(:inventory => @item.inventory - li.quantity)
    }
    current_user.current_cart.destroy
    redirect_to cart_path @cart
  end
end

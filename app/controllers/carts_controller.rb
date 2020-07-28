class CartsController < ApplicationController
  def show
    @current_cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find(params[:cart_id])
    cart.update(status: 'submitted')
    cart.line_items.includes(:item).each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    redirect_to cart
  end
end

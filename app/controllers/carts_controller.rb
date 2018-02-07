class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    @cart.items.each do |item|
      item.inventory -= @cart.line_items.find_by_id(item.id).quantity
      item.save
    end
    @cart.tap do |cart|
      cart.user.current_cart.destroy.save
      redirect_to cart_path(cart)
    end
  end

  private

  def set_cart
    @cart = Cart.find_by_id(params[:id])
  end
end

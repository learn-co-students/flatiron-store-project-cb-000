class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find_or_create_by(params[:id])
    @cart.checkout
    current_user.current_cart.destroy
    redirect_to cart_path @cart
  end


end

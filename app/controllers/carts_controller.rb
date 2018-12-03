class CartsController < ApplicationController
  def index
    @carts = current_user.carts.all
    @cart = nil  #partial is setup to expect @cart
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    redirect_to cart_path(@cart)
  end
end

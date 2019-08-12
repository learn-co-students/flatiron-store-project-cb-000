class CartsController < ApplicationController


  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    if self.status = "submitted"
      @cart.update_inventory
      current_user.current_cart.destroy
    redirect_to cart_path(@cart)
    end
  end





end

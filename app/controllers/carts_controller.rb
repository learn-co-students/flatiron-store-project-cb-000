class CartsController < ApplicationController
  def show
  end

  def new
  end

  def checkout
    current_user.current_cart.checkout
    current_user.update(cart_id: nil)
    redirect_to order_path(Order.last)
  end
end

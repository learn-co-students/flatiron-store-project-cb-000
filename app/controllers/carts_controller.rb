class CartsController < ApplicationController
  def show
    @current_cart = current_user.current_cart
  end


  def checkout
    @current_cart = current_user.current_cart
    subtract_quantity(@current_cart)
    @current_cart.status = 'submitted'
    @current_cart.save
    current_user.current_cart = nil
    redirect_to cart_path(@current_cart)
  end

  private

    def subtract_quantity(cart)
      cart.line_items.each do |line_item|
        item = line_item.item
        item.inventory -= line_item.quantity
        item.save
      end
    end
end

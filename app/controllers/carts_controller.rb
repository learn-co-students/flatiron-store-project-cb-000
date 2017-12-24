class CartsController < ApplicationController
  before_action :find_cart!, only: %i(show checkout)

  def show
  end

  def checkout
    subtract_inventory
    @cart.tap { |c| c.user.current_cart.destroy }.save
    redirect_to cart_path(@cart)
  end

  private

  def find_cart!
    @cart = Cart.find(params[:id])
  end

  def subtract_inventory
    @cart.items.each do |item|
      item.inventory -= @cart.line_items.find_by(item_id: item.id).quantity
      item.save
    end
  end

end

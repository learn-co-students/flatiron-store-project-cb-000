class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @line_item = @cart.add_item(cart_params[:items].try(:first))
    @line_item.save
    @cart.save
    redirect_to cart_path(@cart)
  end

  private
    def cart_params
      params.require(:cart).permit(:items => [])
    end
end

class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def update
    @cart = current_user.current_cart
    if @cart.nil?
      @user.new_cart
      @cart = @user.current_cart
    end
    
    @line_item = @cart.add_item(cart_params[:items].try(:first))
    @line_item.save
    @cart.save
    redirect_to cart_path(@cart)
  end

  def checkout
    @cart = current_user.current_cart
    @cart.status = 'submitted'
    current_user.current_cart = nil
    @cart.user.save
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    redirect_to cart_path(@cart)
  end

  private
    def cart_params
      params.require(:cart).permit(:items => [])
    end
end

class CartsController < ApplicationController

  layout "main_layout"
  before_action :load_categories

  def checkout
    cart = Cart.find_by(:id => params[:id])
    order = cart.checkout
    order.update_attribute(:status, "Submitted")
    redirect_to order_path(order), :flash => {:notice => "Your order was submitted successfuly"}
  end

  private

  def load_categories
    @categories = Category.all
  end

end

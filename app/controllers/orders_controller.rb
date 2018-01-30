class OrdersController < ApplicationController

  layout 'main_layout'
  before_action :load_categories

  def show
    @order = Order.find_by(:id => params[:id])
    @order_page = true 
    render :show
  end

  private

  def load_categories
    @categories = Category.all
  end

end

class OrdersController < ApplicationController
  def show
    @order = current_user.orders.last
  end
end

class StoreController < ApplicationController
  def index
    if current_user
      @user = current_user
      if !@user.current_cart
        @user.current_cart = @user.create_current_cart
      end
      @cart = @user.current_cart
    end
    @categories = Category.all
    @items = Item.available_items
    # binding.pry

  end
end

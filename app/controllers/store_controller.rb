class StoreController < ApplicationController
  def index
    # binding.pry
    if current_user
      @user = current_user
      @user.current_cart ||= @user.create_current_cart
      @cart = @user.current_cart
    end
    @categories = Category.all
    @items = Item.available_items

  end
end

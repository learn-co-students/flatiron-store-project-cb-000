class StoreController < ApplicationController
  def index
    # binding.pry
    if current_user
      @user = current_user
    end
    @categories = Category.all
    @items = Item.available_items

  end
end

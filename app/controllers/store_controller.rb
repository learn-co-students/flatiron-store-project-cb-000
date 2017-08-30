class StoreController < ApplicationController

  def index
    @categories = Category.order(:title)
    @items = Item.available_items
  end

end

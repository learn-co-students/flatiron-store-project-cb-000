class StoreController < ApplicationController
  def index
    @categories = Category.all
    @item = Item.available_items
  end
end

class StoreController < ApplicationController

    layout  "main_layout"

    def index
      @categories = Category.all
      @items = Item.all
    end


end

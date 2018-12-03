class ItemsController < ApplicationController
  def show
    @item = Item.find params[:id] #items so we can share the same partial
  end
end

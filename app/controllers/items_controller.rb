class ItemsController < ApplicationController

  layout "main_layout"
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  before_action :load_categories

  def show
    @item = Item.find(params[:id])
    render :show
  end


  private

  def load_categories
    @categories = Category.all
  end

end

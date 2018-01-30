class CategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  layout "main_layout"
  before_action  :load_categories, :only => [:index ,:show]

  def index
    @categories = Category.all
    render :index
  end

  def show
    @category = Category.find(params[:id])
    render :show
  end

  
  private
  def load_categories
    @categories = Category.all
  end

end

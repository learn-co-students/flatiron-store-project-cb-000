class CategoriesController < ApplicationController
  before_action :find_category!

  def index
    @categories = Category.all
  end

  def show
  end

  private

  def find_category!
    @category = Category.find(params[:id])
  end
end

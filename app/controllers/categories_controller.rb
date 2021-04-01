class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:category_name)
  end

  def show
    @category = Category.find(params[:id])
  end
end

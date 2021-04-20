class ProductsController < ApplicationController
  def index
    @products = Product.order(:product_name).page(params[:page])
    @nps = Product.where("created_at > ?", 3.days.ago)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = if params[:search_term].blank?
                  Product.all
                elsif params[:c_select].blank?
                  Product.where("product_name LIKE ? OR description LIKE ?",
                                "%#{params[:search_term]}%",
                                "%#{params[:search_term]}%")
                else

                  Product.where("product_name LIKE ? OR description LIKE ?",
                                "%#{params[:search_term]}%",
                                "%#{params[:search_term]}%")
                         .where("category_id == ?", params[:c_select].to_s)

                end
  end

  def new
    @products = Product.where("created_at > ?", 3.days.ago)
  end
end

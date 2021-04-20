class CartController < ApplicationController
  def index; end

  def create
    # Add param[:id] to the cart

    logger.debug("Adding #{params[:id]} to the cart!")
    id = params[:id].to_i
    session[:shopping_cart] << id # pushes id onto the end of the array
    product = Product.find(id)
    flash[:notice] = "➕ #{product.product_name} added to cart."
    redirect_back(fallback_location: root_path)
  end

  # DELETE /cart/:id
  def destroy
    logger.debug("Removing #{params[:id]} from the cart!")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "➖ #{product.product_name} removed from cart."
    redirect_back(fallback_location: root_path)
  end
end

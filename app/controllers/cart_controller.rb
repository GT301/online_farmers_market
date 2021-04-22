class CartController < ApplicationController
  def index; end

  def create
    # Add param[:id] to the cart

    id = params[:id]
    if session[:shopping_cart].keys.include?(id)
      session[:shopping_cart][id] += 1
    else
      session[:shopping_cart][id] = 1
    end
    product = Product.find(id.to_i)
    flash[:notice] = "➕ #{product.product_name} added to cart."
    redirect_back(fallback_location: root_path)
  end

  # DELETE /cart/:id
  def destroy
    # logger.debug("Removing #{params[:id]} from the cart!")
    id = params[:id]
    session[:shopping_cart].delete(id)
    product = Product.find(id.to_i)
    flash[:notice] = "➖ #{product.product_name} removed from cart."
    redirect_back(fallback_location: root_path)
  end

  def update
    id = params[:id]
    if session[:shopping_cart][id] == 1
      session[:shopping_cart].delete(id)
    else
      session[:shopping_cart][id] -= 1
    end
    product = Product.find(id.to_i)
    flash[:notice] = "<< #{product.product_name} >> removed from cart."
    redirect_back(fallback_location: root_path)
  end
end

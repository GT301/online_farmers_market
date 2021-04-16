class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    # default the shopping cart session to an empty array (if it's nil)
    session[:shopping_cart] ||= []
    # an array of product IDs!
  end

  def cart
    # .find will take in a single value OR an array of values.
    # with an array it will bring back a collection of objects based on those PK id's!
    Product.find(session[:shopping_cart])
  end
end

class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    # default the shopping cart session to an empty array (if it's nil)
    session[:shopping_cart] ||= []
    # an array of product IDs!
  end
end

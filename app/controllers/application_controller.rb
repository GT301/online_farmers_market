class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :initialize_session, :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
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

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :province, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :province, :email, :password, :current_password)
    end
  end
end

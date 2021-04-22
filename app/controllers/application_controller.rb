class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :initialize_session
  before_action :update_allowed_parameters, if: :devise_controller?
  helper_method :cart, :subtotal, :set_province_if_nil

  private

  def initialize_session
    # default the shopping cart session to an empty hash (if it's nil)
    session[:shopping_cart] ||= {}
    # an array of product IDs!
  end

  def cart
    # .find will take in a single value OR an array of values.
    # with an array it will bring back a collection of objects based on those PK id's!
    Product.find(session[:shopping_cart].keys)
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :province_id, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :province_id, :email, :password, :current_password)
    end
  end

  def subtotal
    subtotal = 0
    ids = session[:shopping_cart].keys

    ids.each do |id|
      subtotal += Product.find(id).price * session[:shopping_cart][id]
    end

    subtotal
  end

  def set_province_if_nil
    redirect_to edit_user_registration_path if current_user.province_id.nil?
  end
end

class NewupdateController < ApplicationController
  def index
    @products = Product.where("updated_at > ? AND created_at != updated_at", 3.days.ago)
  end
end

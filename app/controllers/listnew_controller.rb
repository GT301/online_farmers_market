class ListnewController < ApplicationController
  def index
    @products = Product.where("created_at > ?", 3.days.ago)
  end

end

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  validates :product_name, :price, :stock, presence: true
end

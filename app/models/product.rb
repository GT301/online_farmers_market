class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products, dependent: :destroy
  validates :product_name, :price, :stock, presence: true
  has_one_attached :image
  paginates_per 20
end

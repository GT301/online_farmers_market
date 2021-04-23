class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_products, dependent: :destroy
end

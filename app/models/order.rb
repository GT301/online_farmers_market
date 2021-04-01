class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  validates :date, presence: true
end

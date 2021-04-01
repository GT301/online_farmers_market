class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :op_price, :quantity, presence: true
end

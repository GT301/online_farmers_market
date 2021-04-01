class Customer < ApplicationRecord
  belongs_to :tax
  has_many :orders
  validates :name, presence: true
end

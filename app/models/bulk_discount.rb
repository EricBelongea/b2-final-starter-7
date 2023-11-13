class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  validates :name, presence: true
  validates :percentage, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
class Stock < ApplicationRecord
  belongs_to :user
  validates :shares, numericality: { greater_than_or_equal_to: 0 }

end

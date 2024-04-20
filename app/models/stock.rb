class Stock < ApplicationRecord
  belongs_to :user
  validates :total_share, numericality: { greater_than_or_equal_to: 0 }

end

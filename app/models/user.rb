class User < ApplicationRecord
  scope :confirmed_users, -> { where.not(confirmed_at: nil).where(is_approved: false) } #to be approved
  scope :to_confirmed_users, -> { where(confirmed_at: nil) } #to be confirmed

  validates :balance, numericality: { greater_than_or_equal_to: 0 }


  has_many :transactions
  has_many :stocks
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end

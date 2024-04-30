class User < ApplicationRecord
  scope :confirmed_users, -> { where.not(confirmed_at: nil).where(is_approved: false) }
  scope :to_confirmed_users, -> { where(confirmed_at: nil) }
  scope :active_users, -> { where.not(confirmed_at: nil).where(is_approved: true) }

  validates :balance, numericality: { greater_than_or_equal_to: 0 }


  has_many :transactions, dependent: :destroy
  has_many :stocks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end

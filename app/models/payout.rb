class Payout < ApplicationRecord
  belongs_to :creator

  validates :amount, :status, presence: true
end

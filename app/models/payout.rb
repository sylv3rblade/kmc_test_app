class Payout < ApplicationRecord
  validates :amount, :status, presence: true
end

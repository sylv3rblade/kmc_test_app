class Payout < ApplicationRecord
  belongs_to :creator

  enum :status, { pending: "pending", paid: "paid" }, validate: true

  validates :amount, :status, presence: true
end

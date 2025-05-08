class Creator < ApplicationRecord
  has_many :payouts, dependent: :destroy

  enum :status, { active: "active", inactive: "inactive" }, validate: true

  validates :name, :email, :status, presence: true
end

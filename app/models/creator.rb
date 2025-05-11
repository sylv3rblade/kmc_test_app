class Creator < ApplicationRecord
  has_many :payouts, dependent: :destroy

  enum :status, { active: "active", inactive: "inactive" }, validate: true

  validates :name, :email, :status, presence: true
  validates_uniqueness_of :email

  scope :with_payouts_summary, -> {
    left_joins(:payouts)
      .select('creators.*',
              "SUM(CASE WHEN payouts.status = 'paid' THEN payouts.amount ELSE 0 END) AS total_paid_amount",
              "COUNT(CASE WHEN payouts.status = 'pending' THEN 1 ELSE NULL END) AS pending_payouts_count")
      .group(:id)
      .order(:id)
  }
end

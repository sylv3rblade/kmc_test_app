class Creator < ApplicationRecord
  enum :status, { active: "active", inactive: "inactive" }, validate: true

  validates :name, :email, :status, presence: true
end

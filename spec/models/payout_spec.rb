require 'rails_helper'

RSpec.describe Payout, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      payout = build(:payout)
      expect(payout).to be_valid
    end

    it "is not valid without an amount" do
      payout = build(:payout, amount: nil)
      expect(payout).not_to be_valid
      expect(payout.errors[:amount]).to include("can't be blank")
    end

    it "is not valid without a status" do
      payout = build(:payout, status: nil)
      expect(payout).not_to be_valid
      expect(payout.errors[:status]).to include("can't be blank")
    end
  end
end

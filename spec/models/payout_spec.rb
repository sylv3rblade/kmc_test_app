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

    it "is not valid without a creator" do
      payout = build(:payout, creator: nil)
      expect(payout).not_to be_valid
      expect(payout.errors[:creator]).to include("must exist")
    end
  end

  describe "associations" do
    it "has many payouts" do
      creator = create(:creator)
      payout = create(:payout, creator: creator)
      expect(creator.payouts).to include(payout)
    end
  end

  describe '#mark_as_paid' do
    let(:payout) { create(:payout, status: 'pending') }

    it 'updates the status to paid' do
      payout.mark_as_paid
      expect(payout.status).to eq('paid')
    end
  end
end

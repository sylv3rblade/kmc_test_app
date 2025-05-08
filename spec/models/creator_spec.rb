require 'rails_helper'

RSpec.describe Creator, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      creator = build(:creator)
      expect(creator).to be_valid
    end

    it "is not valid without a name" do
      creator = build(:creator, name: nil)
      expect(creator).not_to be_valid
      expect(creator.errors[:name]).to include("can't be blank")
    end

    it "is not valid without an email" do
      creator = build(:creator, email: nil)
      expect(creator).not_to be_valid
      expect(creator.errors[:email]).to include("can't be blank")
    end

    it "is not valid without a status" do
      creator = build(:creator, status: nil)
      expect(creator).not_to be_valid
      expect(creator.errors[:status]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "belongs to creator" do
      creator = create(:creator)
      payout = create(:payout, creator: creator)
      expect(payout.creator).to eq(creator)
    end
  end

  describe '.with_payouts_summary' do
    it 'returns total paid amount and pending payouts count per creator' do
      creator = create(:creator)

      create(:payout, creator:, amount: 100, status: 'paid')
      create(:payout, creator:, amount: 200, status: 'paid')
      create(:payout, creator:, amount: 300, status: 'pending')

      result = Creator.with_payouts_summary.find(creator.id)

      expect(result.total_paid_amount.to_f).to eq(300.0)
      expect(result.pending_payouts_count.to_i).to eq(1)

      expect(result.total_paid_amount.to_f).to eq(300.0)
      expect(result.pending_payouts_count.to_i).to eq(1)
    end
  end
end

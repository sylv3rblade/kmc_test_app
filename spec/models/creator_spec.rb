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
end

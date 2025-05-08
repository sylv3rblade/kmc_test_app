require 'rails_helper'

RSpec.describe Creator, type: :model do
  subject { described_class.new(name: "John Doe", email: "john@example.com", status: "active") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to include("can't be blank")
    end

    it "is not valid with an invalid status" do
      subject.status = "archived"
      expect(subject).not_to be_valid
      expect(subject.errors[:status]).to include("is not included in the list")
    end
  end
end

require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "when email has wrong format" do
    it "is invalid format without dot com" do
      expect(FactoryBot.build(:customer, email: "customer@example")).not_to be_valid
    end

    it "is invalid format without @ and dot com" do
      expect(FactoryBot.build(:customer, email: "customer")).not_to be_valid
    end
  end

  context "when email has correct format" do
    it "is valid format email" do
      expect(FactoryBot.build(:customer, email: "customer@example.com")).to be_valid
    end
  end
end

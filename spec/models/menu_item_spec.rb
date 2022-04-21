require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is invalid without a price' do
    menu_item = FactoryBot.build(:menu_item, price: nil)
    menu_item.valid?
    expect(menu_item.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without a name' do
    menu_item = FactoryBot.build(:menu_item, name: nil)
    menu_item.valid?
    expect(menu_item.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    menu_item_1 = FactoryBot.create(:menu_item, name: 'Nasi Uduk')
    menu_item_2 = FactoryBot.build(:menu_item, name: 'Nasi Uduk')
    menu_item_2.valid?
    expect(menu_item_2.errors[:name]).to include("has already been taken")
  end

  it "is not accept price less 0.01" do
    menu_item = FactoryBot.build(:menu_item, price: 0)
    menu_item.valid?
    expect(menu_item.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid description have more then to 150 characters" do
    menu_item = FactoryBot.build(:menu_item, description: "Like any other social media site Facebook has length requirements when it comes to writing on the wall, providing status, messaging and commenting. Understanding how many characters you can use, enables you to more effectively use Facebook as a business or campaign tool.")
    menu_item.valid?
    expect(menu_item.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  describe 'self#by_letter' do
    describe 'with matching latter' do
      it "should return a sorted array of results that match" do
        menu_item_1 = FactoryBot.create(:menu_item, name: 'Telur Dadar')
        menu_item_2 = FactoryBot.create(:menu_item, name: 'Kerak Telor')
        menu_item_3 = FactoryBot.create(:menu_item, name: 'Telor Ceplok')

        expect(MenuItem.by_letter("T")).to eq([menu_item_3, menu_item_1])
      end
    end
  end
end

require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menu_item)).to be_valid
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
    menu_item = FactoryBot.create(:menu_item, price: 0)

    menu_item.valid?

    expect(menu_item.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid description have more then to 150 characters" do
    menu_item = FactoryBot.create(:menu_item, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")

    menu_item.valid?

    expect(menu_item.errors[:description]).to include("is too long (maximum is 150 characters)")
  end
end

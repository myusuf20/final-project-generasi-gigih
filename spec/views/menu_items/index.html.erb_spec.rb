require 'rails_helper'

RSpec.describe "menu_items/index", type: :view do
  before(:each) do
    assign(:menu_items, [
      MenuItem.create!(
        name: "Name",
        description: "MyText",
        price: 2
      ),
      MenuItem.create!(
        name: "Name",
        description: "MyText",
        price: 2
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end

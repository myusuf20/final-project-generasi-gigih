require 'rails_helper'

RSpec.describe "menu_items/index", type: :view do
  before(:each) do
    assign(:menu_items, [
      MenuItem.create!(
        name: "Semur",
        description: "MyText",
        price: 2
      ),
      MenuItem.create!(
        name: "Rendang",
        description: "MyText",
        price: 2
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    assert_select "tr>td", mame: "Semur".to_s, count: 2
    assert_select "tr>td", description: "MyText".to_s, count: 2
    assert_select "tr>td", price: 2.to_s, count: 2
    assert_select "tr>td", mame: "Rendang".to_s, count: 2
    assert_select "tr>td", description: "MyText".to_s, count: 2
    assert_select "tr>td", price: 2.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "menu_items/new", type: :view do
  before(:each) do
    assign(:menu_item, MenuItem.new(
      name: "MyString",
      description: "MyText",
      price: 1
    ))
  end

  it "renders new menu_item form" do
    render

    assert_select "form[action=?][method=?]", menu_items_path, "post" do

      assert_select "input[name=?]", "menu_item[name]"

      assert_select "textarea[name=?]", "menu_item[description]"

      assert_select "input[name=?]", "menu_item[price]"
    end
  end
end

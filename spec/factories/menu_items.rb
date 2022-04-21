FactoryBot.define do
  factory :menu_item do
    name { "Ketoprak Sayur" }
    description { "The most popular food" }
    price { 10000 }
  end

  factory :invalid_menu_item, parent: :menu_item do
    name { nil }
    description { nil }
    price { 10000 }
  end
end

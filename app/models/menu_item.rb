class MenuItem < ApplicationRecord
  has_many :menu_categories
  has_many :order_details
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }

  def self.by_letter(letter)
    where("name LIKE?", "#{letter}%").order(:name)
  end
end

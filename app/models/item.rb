class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :days_delivery
  belongs_to :delivery_cost

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :price, numericality: { less_than_or_equal_to: 99999, greater_than_or_equal_to: 300 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :prefecture_id
    validates :days_delivery_id
    validates :delivery_cost_id
  end
end

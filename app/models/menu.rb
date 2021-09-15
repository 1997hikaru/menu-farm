class Menu < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :menu_category

  with_options presence: true do
    validates :recipe_title
    validates :ingredients_list
    validates :step
    validates :point
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :menu_category_id
  end
end
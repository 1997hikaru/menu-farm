class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.references :user,                   null: false, foreign_key: true
      t.references :item,                   null: false, foreign_key: true
      t.string     :recipe_title,           null: false
      t.text       :ingredients_list,       null: false
      t.text       :step,                   null: false
      t.text       :point,                  null: false
      t.integer    :category_id,            null: false
      t.integer    :menu_category_id,       null: false
      t.timestamps
    end
  end
end

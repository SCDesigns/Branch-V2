class CreateCityCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :city_categories do |t|
      t.references :city, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end

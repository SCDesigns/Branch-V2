class CreateCityCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :city_categories do |t|
      t.references :city, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end

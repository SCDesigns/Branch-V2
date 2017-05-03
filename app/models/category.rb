class Category < ApplicationRecord
  has_many :city_categories
  has_many :cities, :through => :city_categories
  has_many :branches
end

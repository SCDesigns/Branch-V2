class City < ApplicationRecord
  has_many :city_categories
  has_many :categories, through: :city_categories
  has_many :branches
  has_many :branches, through: :categories
end

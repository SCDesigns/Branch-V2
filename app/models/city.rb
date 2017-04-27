class City < ApplicationRecord
  has_many :categories
  has_many :branches
  has_many :branches, through: :categories
end

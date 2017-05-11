class City < ApplicationRecord
  has_many :categories
  has_many :branches, through: :categories

  validates :name, presence: true, uniqueness: true, allow_blank: false
end

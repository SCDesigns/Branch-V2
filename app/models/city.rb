class City < ApplicationRecord
  has_many :city_categories
  has_many :categories, through: :city_categories
  has_many :branches, through: :categories

  validates :name, presence: true, uniqueness: true, allow_blank: false

  accepts_nested_attributes_for :categories, reject_if: proc {|attributes| attributes['name'].blank?}
end

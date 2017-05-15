class Category < ApplicationRecord
  has_many :city_categories
  has_many :cities, through: :city_categories
  has_many :branches

  validates :name, presence: true, allow_blank: false

  accepts_nested_attributes_for :cities, reject_if: proc {|attributes| attributes['name'].blank?}
end

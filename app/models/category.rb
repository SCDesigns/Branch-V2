class Category < ApplicationRecord
  belongs_to :city
  has_many :branches

  validates :name, presence: true, allow_blank: false
end

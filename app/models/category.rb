class Category < ApplicationRecord
  has_many :city_categories
  has_many :cities, through: :city_categories
  has_many :branches

  validates :name, presence: true, uniqueness: true, allow_blank: false
  def cities_attributes=(cities_hashes)
    cities_hashes.each do |i, city_attributes|
      if city_attributes[:name].present?
        city = City.find_or_create_by(name: city_attributes[:name])
        if !self.cities.include?(city)
          self.city_categories.build(:city => city)
        end
      end
    end
  end
end

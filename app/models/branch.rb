class Branch < ApplicationRecord
  belongs_to :city
  belongs_to :category
  belongs_to :creator, class_name: :user, foreign_key: :user_id
  has_many :comments
  has_many :attendees
  has_many :users, through: :attendees
end

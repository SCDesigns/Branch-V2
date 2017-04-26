class Branch < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :guests, through: :attendees, class_name: 'User'
  has_many :attendees
  has_many :comments, through: :attendees
end

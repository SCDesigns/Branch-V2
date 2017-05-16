class Branch < ApplicationRecord
  belongs_to :category
  belongs_to :city
  belongs_to :user

  has_many :guests, through: :attendees, class_name: 'User'
  has_many :attendees
  has_many :comments, through: :attendees

  validates :name, :organization, :date, :location, :info, presence: true

  def self.most_recent
    order("created_at desc")
  end
end

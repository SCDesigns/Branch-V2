class Branch < ApplicationRecord
  belongs_to :category
  belongs_to :city
  belongs_to :user

  has_many :comments

  validates :name, :organization, :date, :location, :info, presence: true

  def self.most_recent
    order(created_at: :desc).limit(6)
  end
end

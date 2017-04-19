class Attendee < ApplicationRecord
  has_many :users
  has_many :branches
end

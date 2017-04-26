class User < ApplicationRecord
  has_many :branches
  has_many :comments
  has_many :attendees
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
end

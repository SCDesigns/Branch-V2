class Comment < ApplicationRecord
  belongs_to :branch
  belongs_to :user, optional: true
end

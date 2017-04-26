class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :branch

def initialize(user, category)
  @user = user
  @category = category
end

def update?
  @user.try(:admin?)
end
end

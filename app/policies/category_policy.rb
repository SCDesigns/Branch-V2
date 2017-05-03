class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def create?
    @user.try(:admin?)
  end

  def update?
    @user.try(:admin?)
  end
end

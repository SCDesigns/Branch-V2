class CityPolicy < ApplicationPolicy
  attr_reader :user,

  def create?
    user.admin?
  end

  def update?
    user.admin? || user.moderator?
  end

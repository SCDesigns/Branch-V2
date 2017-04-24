class BranchPolicy < ApplicationPolicy
  attr_reader :user

  def update?
    user.admin? || user.moderator? || record.try(:user) == user
  end

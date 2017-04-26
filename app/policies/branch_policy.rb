class BranchPolicy < ApplicationPolicy
  attr_reader :user, :branch

  def initialize(user, branch)
    @user = user
    @branch = branch
  end

  def update?
    user.admin? || branch.try(:user) == user
  end
end

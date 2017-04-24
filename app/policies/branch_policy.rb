class ApplicationPolicy
  attr_reader :user, :record

  def update?
    user.admin? || user.moderator? || record.try(:user) == user
  end

class CityPolicy < ApplicationPolicy
    attr_reader :user, :city

    def initialize(user, city)
      @user = user
      @city = city
    end

    def create?
      @user.try(:admin?)
    end

    def update?
      @user.try(:admin?)
    end
  end

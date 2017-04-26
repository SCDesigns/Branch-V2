class WelcomeController < ApplicationController
  def home
    if current_user
      redirect_to cities_path
    end
  end
end

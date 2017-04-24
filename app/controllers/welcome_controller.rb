class WelcomeController < ApplicationController
  def home
    if current_user
      redirect_to branches_path
    end
  end
end

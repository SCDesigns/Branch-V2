class WelcomeController < ApplicationController
  def home
    if current_user
      redirect_to branches_path
    else
    end
  end
end

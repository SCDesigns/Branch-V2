class WelcomeController < ApplicationController
  def home
      if user_signed_in?
          redirect_to branches_path
      else
          redirect_to sign_in_path
      end
  end
end

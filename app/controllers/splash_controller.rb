class SplashController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to categories_path if current_user
  end
end

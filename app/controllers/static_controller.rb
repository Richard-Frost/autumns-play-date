class StaticController < ApplicationController
  def welcome
    redirect_to '/home' if current_user
  end
end

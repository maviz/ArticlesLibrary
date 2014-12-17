class LandingController < ApplicationController
  layout 'basic'
  def index
    @users = User.all
    @categories = Category.includes(:articles)
  end
end

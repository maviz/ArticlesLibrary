class LandingController < ApplicationController
  layout 'basic'
  def index
    @users = User.all
    @categories = Category.all.includes(:articles)
  end
end

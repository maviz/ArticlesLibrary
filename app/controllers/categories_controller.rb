class CategoriesController < ApplicationController

  layout 'basic'
  def index
  end

  def show
    @category = Category.includes(:articles).find_by_id(params[:id])
  end


  def create

  end

  def new
  end

  def edit
  end

end


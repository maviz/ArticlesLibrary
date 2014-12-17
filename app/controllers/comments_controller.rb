class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @comment = Article.find_by_id(params[:article_id]).comments.create!({ body: params[:body], name: params[:name], email: params[:email]}) rescue nil
    @comment.save
    respond_to do |format|
      format.js
    end
  end


  def update

  end

  def destroy

  end

end
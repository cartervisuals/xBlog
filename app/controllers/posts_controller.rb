class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @catergories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @catergories = Category.all
    @comment = Comment.new
    @comments = Comment.all
  end

end

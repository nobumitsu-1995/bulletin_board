class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(id: "desc")
  end

  def create
    @post = Post.create!(post_params)
  end

  def destroy


  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end

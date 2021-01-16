class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "desc")
    @post = Post.new
  end

  def create
    @posts = Post.all.order(id: "desc")
    @post = Post.create!(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end

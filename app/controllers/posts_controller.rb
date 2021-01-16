class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(id: "desc")
  end

  def create
    @post = Post.create!(post_params)
    @post.user = @current_user.id
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end

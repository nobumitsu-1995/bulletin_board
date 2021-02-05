class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(id: "desc")
    @user = User.new
  end

  def create
    @post = Post.create!(post_params)
    if @current_user
      @post.user = @current_user.id
      @post.save
    else
      @post.user = nil
      @post.save
    end
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

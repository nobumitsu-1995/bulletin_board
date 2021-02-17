class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(id: "desc").includes(:user).page(params[:page]).per(10)
    @user = User.new
  end

  def create
    @post = Post.new(post_params)
    if @current_user
      @post.update!(user_id: @current_user.id)
    else
      @post.update!(user_id: 0)
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

class UsersController < ApplicationController
  def create
    if params[:password] && params[:password_confirmation]
      if params[:password] == params[:password_confirmation]
        @user = User.create!(user_params)
        session[:user_id] = @user.id
        @current_user = User.find_by(id: session[:user_id])
        redirect_to("/")
      else
        @posts = Post.all.order(id: "desc")
        flash[:notice] = "パスワードが一致しません"
        render("posts/index")
      end
    else

    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  def update

  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}でログインしました。"
      redirect_to("/")
    else
      flash[:notice] = "ログイン情報が間違っています。"
      @posts = Post.all.order(id: "desc")
      render("posts/index")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/")
  end

  private
  def user_params
    params.permit(:name, :password, :email)
  end

end

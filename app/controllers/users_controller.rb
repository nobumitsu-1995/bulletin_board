class UsersController < ApplicationController
  def create
    if params[:password] == true
      if params[:password] == params[:password_confirmation]
        @user = User.create!(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to("/")
        end
      else
        @posts = Post.all.order(id: "desc")
        flash[:notice] = "パスワードが一致しません"
        render("posts/index")
      end
    else
      flash[:notice] = "パスワードを入力してください"
      redirect_to("/")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  def update

  end

  def login
    @user = User.find_by(email: params[:login_email])
    if @user && @user.authenticate(params[:login_password])
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}でログインしました。"
      redirect_to("/")
    else
      flash[:notice] = "ログイン情報が間違っています。"
      redirect_to("/")
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

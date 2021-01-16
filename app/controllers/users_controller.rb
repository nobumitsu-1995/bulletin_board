class UsersController < ApplicationController
  def create
    if params[:password] && params[:password_confirmation]
      if params[:password] == params[:password_confirmation]
        @user = User.create!(user_params)
        session[:user_id] = @user.id
        @current_user = User.find_by(id: session[:user_id])
      else
        flash[:notice] = "パスワードが一致しません"
      end
    else

    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  def update
    @user = User.find_by(id: params[:id])

  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}でログインしました。"
    else
      flash[:notice] = "ログイン情報が間違っています。"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
  end

  private
  def user_params
    params.permit(:name, :password, :email)
  end

end

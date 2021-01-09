class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update

  end

  def login

  end

  def logout

  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end

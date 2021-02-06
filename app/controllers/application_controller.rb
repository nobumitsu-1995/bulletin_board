class ApplicationController < ActionController::Base
protect_from_forgery
before_action :set_current_user

  def set_current_user
    if session[:login_user_id]
      @current_user = User.find_by(id:session[:login_user_id])
    end
  end

end

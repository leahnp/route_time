class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    # raise
    @user = User.find_or_create_from_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, notice: "Failed to save the user"
    end
  end
end

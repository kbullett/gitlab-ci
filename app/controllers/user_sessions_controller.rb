class UserSessionsController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new
    user = @user_session.authenticate(params[:user_session])

    if user && sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out

    redirect_to new_user_sessions_path
  end
end

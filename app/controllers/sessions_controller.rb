class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.first_name}!"
    else
      flash.now[:alert] = 'Log in failed...'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to recipes_path, notice: 'Logged out...'
  end

end

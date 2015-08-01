class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to recipes_path, notice: "Happy eating, #{@user.first_name}!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(secure_params)

    if @user.save
      redirect_to user_path(params[:id]), notice: 'updated!'
    else
      render :edit
    end
  end


  protected

  def secure_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end

end

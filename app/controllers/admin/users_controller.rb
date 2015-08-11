class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save
      redirect_to admin_users_path, notice: "User, #{@user.first_name} created!"
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
      redirect_to admin_users_path, notice: 'updated!'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to admin_users_path, notice: "#{@user.username} deleted! "
    else
      redirect_to admin_users_path, notice: "failed to delete #{@user.username}"
    end
  end


    protected

  def secure_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :admin)
  end

end

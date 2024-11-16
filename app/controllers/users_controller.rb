class UsersController < ApplicationController
  before_action :prevent_logged_in_user_access

  def index
    @users = User.select(:username)
  end 
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path, notice: 'Logged In'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end 
end

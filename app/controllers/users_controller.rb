class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      flash[:warning] = “This email already exists”
      redirect_to new_user_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

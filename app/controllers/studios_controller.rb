class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
  end

  def new
    # @user = User.find(params[:id])
    # @studio = @user.studios.new
    @studio = current_user.studios.new
  end

  def create
    @studio = current_user.studios.new(studio_params)
    @studio.save
    redirect_to "/"
  end

  def edit
  end

  def update
  end

  def destroy
    @studio = Studio.find(params[:id])
    @dweed.destroy
    redirect_to "/"
  end
  private
  def studio_params
    return params.require(:studio).permit(:name, :address, :phone, :website, :image_url)

  end
end

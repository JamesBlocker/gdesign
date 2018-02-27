class StudiosController < ApplicationController
  before_action :verify_studio_user, only: [:edit, :update, :destroy]
  
  def index
    @bananas = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @user = User.find(@studio.user_id)
  end

  def new
    # @user = User.find(params[:id])
    # @studio = @user.studios.new
    @studio = current_user.studios.new
  end

  def create
    @studio = current_user.studios.new(studio_params)
    @studio.save
    redirect_to studio_path(@studio.id)
  end

  def edit
    # we can use @studio already because by the time we get here, verify_studio_user already ran
    # @studio = Studio.find(params[:id])
  end

  def update
    # @studio = Studio.find(params[:id])
    @studio.name = params[:studio][:name]
    @studio.address = params[:studio][:address]
    @studio.phone = params[:studio][:phone]
    @studio.website = params[:studio][:website]
    @studio.image_url = params[:studio][:image_url]
    @studio.save
    redirect_to studio_path(@studio.id)
  end

  def destroy
    # @studio = Studio.find(params[:id])
    @studio.destroy
    redirect_to user_path(current_user.id)
  end
  private
  def studio_params
    return params.require(:studio).permit(:name, :address, :phone, :website, :image_url)
  end

  def verify_studio_user
    @studio = Studio.find(params[:id])
    redirect_to root_path unless @studio.user == current_user
  end
end

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
    @user = User.find(params[:id])
    @studio = @user.studios.new
    @studio.name = params[:studio][:name]
    @studio.address = params[:studio][:address]
    @studio.phone = params[:studio][:phone]
    @studio.website = params[:studio][:website]
    @studio.image_url = params[:studio][:image_url]
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
end

class CamerasController < ApplicationController
  respond_to :html, :json

  def index
    @cameras = Camera.all
    respond_with @cameras
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = current_user.cameras.new
  end

  def update
    @camera = current_user.cameras.find(params[:id])

    if @camera.update(camera_params)
      redirect_to @camera
    else
      render :edit
    end
  end

  def edit
    @camera = current_user.cameras.find(params[:id])
  end

  def create
    @camera = current_user.cameras.new(camera_params)

    if @camera.save
      redirect_to @camera
    else
      render :new
    end
  end

  def destroy
    @camera = current_user.cameras.find(params[:id])
    @camera.destroy

    redirect_to cameras_path
  end

  private
    def camera_params
      params.require(:camera).permit(:name)
    end
end

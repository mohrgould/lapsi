module Api
  module V1
    class CamerasController < Api::BaseController
      before_filter :restrict_access
      respond_to :json

      def index
        respond_with Camera.all
      end

      def show
        respond_with Camera.find(params[:id])
      end

      def create
        repond_with Camera.create(params[:camera])
      end

      def update
        respond_with Camera.update(params[:id], params[:camera])
      end

      def destroy
        respond_with Camera.destroy(params[:id])
      end

    end
  end
end

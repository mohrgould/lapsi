module Api
  module V1
    class FramesController < Api::BaseController
      before_filter :restrict_access
      respond_to :json

      def index
        @camera = current_user.cameras.find(params[:camera_id])
        respond_with @camera.frames.all
      end

      def create
        @camera = current_user.cameras.find(params[:camera_id])
        respond_with @camera.frames.create(params[:frame])
      end

      def submit
        @camera = current_user.cameras.find(params[:camera_id])
        frame = @camera.frames.create(ts: params[:ts], image: params[:image])
        if (!@camera.last_frame) || frame.ts > @camera.last_frame.ts
          @camera.last_frame_id = frame.id
          @camera.save
        end
        respond_with frame
      end

    private

      def frame_params
      end

    end
  end
end

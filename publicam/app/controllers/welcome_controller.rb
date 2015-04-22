class WelcomeController < ApplicationController
  def index
    @cameras = Camera.where('last_frame_id is not null')
  end
end

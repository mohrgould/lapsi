module Api
  class BaseController < ApplicationController
    protect_from_forgery
    skip_before_action :verify_authenticity_token, if: :json_request?

  protected
    def json_request?
      request.format.json?
    end

    def current_user
      @current_user ||= ApiKey.find_by_access_token(params[:access_token]).user
    end

    def restrict_access
      if params[:access_token]
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      #else
      #  authenticate_or_request_with_http_token do |token, options|
      #    ApiKey.exists?(access_token: token)
      end
    end

  end
end

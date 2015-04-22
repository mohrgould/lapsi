class ApiKeysController < ApplicationController
  respond_to :html, :json
  def index
    @keys = current_user.api_keys.all
    respond_with @keys
  end

  def new
    @key = current_user.api_keys.new
    @key.save
    render :show
  end

  def destroy
    @key = current_user.api_keys.find(params[:id])
    @key.destroy
    redirect_to user_api_keys_path(current_user)
  end
end

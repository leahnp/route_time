require_relative '../../lib/GoogleDirectionsApiWrapper'

class RoutesController < ApplicationController
  def new
    # @user = User.find(current_user.id)
    @location = Location.new
    @my_locations = Location.all
    # raise
  end

  def create
    # raise
    location = Location.new(create_params[:location])
    location.user_id = current_user.id
    if location.save
      redirect_to :root 
    else
      boh
    end
  end



  def get_data
    # call wrapper
  end

  private

   def create_params
      # params.permit(location: [:address])
      params.permit(location: [:address, :name])
   end
end

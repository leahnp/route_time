require_relative '../../lib/GoogleDirectionsApiWrapper'

class RoutesController < ApplicationController
  def new_location
    @user = User.find(current_user.id)
    @location = Location.new
  end

  def create_location
    location = Location.new(params[:location])
    if location.save
      redirect_to root  
    else
      boh
    end
  end



  def get_data
    # call wrapper
  end
end

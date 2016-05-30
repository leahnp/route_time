require_relative '../../lib/GoogleDirectionsApiWrapper'

class RoutesController < ApplicationController
  def new
    @location = Location.new
    @my_locations = Location.all
  end

  def create
    location = Location.new(create_params[:location])
    location.user_id = current_user.id
    if location.save
      redirect_to :root 
    else
      boh
    end
  end

  def get_data
    destination = params["address_info"].lstrip
    origin = "#{params["lat"]},#{params["lon"]}"
    data = GoogleDirectionsApiWrapper.search(origin, destination)
    render :json => {
      time: data["routes"][0]["legs"][0]["duration"]["text"]
    }
    # redirect_to root
  end

  def destroy
    location = Location.find(params["location_id"])
    location.destroy
    redirect_to :root
  end

  private

   def create_params
      params.permit(location: [:address, :name])
   end
end

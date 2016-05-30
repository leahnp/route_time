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
    puts params
    destination = params["address_info"].lstrip
    origin = "#{params["lat"]},#{params["lon"]}"
    puts "DESTINATIONNNN"
    puts destination
    puts "ORIGINSSSSSS"
    puts origin
    data = GoogleDirectionsApiWrapper.search(origin, destination)
    puts "DATAAAAA"
    puts data
    # time = data["routes"][0]["legs"][0]["duration"]["text"]
    render :json => {
      time: data["routes"][0]["legs"][0]["duration"]["text"]
    }
    # redirect_to root
  end

  private

   def create_params
      # params.permit(location: [:address])
      params.permit(location: [:address, :name])
   end
end

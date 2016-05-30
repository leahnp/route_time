require 'httparty'

module GoogleDirectionsApiWrapper
  BASE_URL = "http://maps.googleapis.com/maps/api/directions/json?"
  # outputFormat?parameters

  def self.search(origin, destination)
    # origin string coordinatinos
    # destination address or coordinates NO SPACE BETWEEN COORDINATES
    test = {query: {
              "origin": origin,
              "destination": destination
               }}


    @data = HTTParty.post(BASE_URL,
    test)
  end
  #headers: {"Content-Type" => "application/json", "Accept" => "application/json"}

end
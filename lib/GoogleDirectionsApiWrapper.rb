require 'httparty'

module GoogleDirectionsApiWrapper
  BASE_URL = "http://maps.googleapis.com/maps/api/directions/json?"
  # outputFormat?parameters

  def self.search()#(origin, destination)
    # origin string coordinatinos
    # destination address or coordinates NO SPACE BETWEEN COORDINATES
    body_query = {
              "origin": "47.680585,-122.323788",
              "destination": "47.687188,-122.005437"
               }


    @data = HTTParty.post(BASE_URL,
    body: body_query.to_json)
  end
  #headers: {"Content-Type" => "application/json", "Accept" => "application/json"}

end
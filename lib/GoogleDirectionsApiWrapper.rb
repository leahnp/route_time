require 'httparty'

module GoogleDirectionsApiWrapper
  BASE_URL = "http://maps.googleapis.com/maps/api/directions/json?"

  def self.search(origin, destination)
    # origin string coordinates or addy
    # destination address or coordinates NO SPACE BETWEEN COORDINATES
    # departure time not specified == NOW
    # traffic model defaults to 'best guess'
    q = {query: {
              "origin": origin,
              "destination": destination,
              "duration_in_traffic": "true"
               }}
    @data = HTTParty.post(BASE_URL, q)
  end
end
require 'httparty'

module GoogleDirectionsApiWrapper
  BASE_URL = "http://maps.googleapis.com/maps/api/directions/"
  # outputFormat?parameters

  def self.search(origin, destination)
    # origin string coordinatinos
    # destination address or coordinates
    body_query = {
              "origin": origin,
              "destination": destination
               }


    @data = HTTParty.post(BASE_URL + "BOH?", headers: {"Content-Type" => "application/json", "Accept" => "application/json"},
    body: body_query.to_json)
  end

end
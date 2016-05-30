require 'httparty'

module GoogleDirectionsApiWrapper
  BASE_URL = "http://maps.googleapis.com/maps/api/directions/outputFormat?parameters"

  def self.search(origin, destination)

    body_query = {
      "origin": {
        "country": origin[:country],
        "state": origin[:country],
        "city": origin[:country],
        "zip": origin[:country]
        },
      "destination": {
          "country": destination[:country],
          "state": destination[:state],
          "city": destination[:city],
          "zip": destination[:zip] },
          }

          
    @data = HTTParty.post(BASE_URL + "BOH?", headers: {"Content-Type" => "application/json", "Accept" => "application/json"},
    body: body_query.to_json)
  end

end
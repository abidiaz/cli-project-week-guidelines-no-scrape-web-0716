require 'rest-client'
require 'pry'
require 'json'


class ApiCommunicator

  attr_reader :incident_data
  
  def initialize
    @url = "https://data.cityofnewyork.us/resource/a6b3-u8ax.json"
    response_data = RestClient.get(@url)
    @incident_data = JSON.parse(response_data) 
end
end

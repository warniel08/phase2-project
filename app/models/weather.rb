require 'httparty'
require 'json'

class Weather < ActiveRecord::Base
  def self.weather_man
    #need to write the weather api stuff here
    state = "WA"
    city = "Seattle"
    url = "http://api.wunderground.com/api/#{ENV["WEATHER_UNDERGROUND_API_KEY"]}/geolookup/conditions/q/#{state}/#{city}.json"
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    location = data['location']['city']
    temp_f = data['current_observation']['temp_f']
    p data
    p "Current temperature in #{location} is: #{temp_f}"
    # return temp_f

    @weather = Weather.find_or_create_by(temperature: temp_f, weather_img: data['icon_url'])

    # open(url) do |f|
    #   json_string = f.read
    #   parsed_json = JSON.parse(json_string)
    #   location = parsed_json['location']['city']
    #   temp_f = parsed_json['current_observation']['temp_f']
    #   print "Current temperature in #{location} is: #{temp_f}\n"
    # end
  end
end

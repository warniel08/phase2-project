require 'httparty'
require 'open-uri'
require 'json'

class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, { presence: true }

  def self.most_recent
    Post.order(created_at: :desc).limit(5)
  end

  def self.weather_man
    #need to write the weather api stuff here
    state = "WA"
    city = "Seattle"
    url = "http://api.wunderground.com/api/#{ENV["WEATHER_UNDERGROUND_API_KEY"]}/geolookup/conditions/q/#{state}/#{city}.json"
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    location = data['location']['city']
    temp_f = data['current_observation']['temp_f']
    p "Current temperature in #{location} is: #{temp_f}"

    # open(url) do |f|
    #   json_string = f.read
    #   parsed_json = JSON.parse(json_string)
    #   location = parsed_json['location']['city']
    #   temp_f = parsed_json['current_observation']['temp_f']
    #   print "Current temperature in #{location} is: #{temp_f}\n"
    # end
  end
end

require 'httparty'
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
    url = "http://api.wunderground.com/api/ENV[WEATHER_UNDERGROUND_API_KEY]/conditions/q/#{state}/#{city}.json"
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    p data
  end
end

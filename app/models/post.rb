class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, { presence: true }

  def self.most_recent
    Post.order(created_at: :desc).limit(5)
  end

  def weather_man
    #need to write the weather api stuff here
  end
end

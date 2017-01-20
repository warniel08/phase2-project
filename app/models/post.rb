class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, { presence: true }

  def self.most_recent
    Post.order(created_at: :desc).limit(5)
  end
end

class RemoveWeatherColumnFromPostsTable < ActiveRecord::Migration
  def change
    remove_column = :posts, :weather
  end
end

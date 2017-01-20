class AddWeatherColumnToPostsTable < ActiveRecord::Migration
  def change
    add_column :posts, :weather, :string
  end
end

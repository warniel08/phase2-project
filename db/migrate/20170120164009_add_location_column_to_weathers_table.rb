class AddLocationColumnToWeathersTable < ActiveRecord::Migration
  def change
    add_column :weathers, :location, :string
  end
end

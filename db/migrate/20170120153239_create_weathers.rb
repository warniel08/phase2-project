class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :temperature
      t.string :weather_img

      t.timestamps(null: false)
    end
  end
end

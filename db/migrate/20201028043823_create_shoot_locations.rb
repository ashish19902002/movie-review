class CreateShootLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :shoot_locations do |t|
      t.string :location_id, index: true
      t.integer :movie_cast_id, index: true

      t.timestamps
    end
  end
end

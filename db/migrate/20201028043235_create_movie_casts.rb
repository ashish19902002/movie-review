class CreateMovieCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_casts do |t|
      t.integer :actor_id, index: true
      t.integer :movie_id, index: true

      t.timestamps
    end
  end
end

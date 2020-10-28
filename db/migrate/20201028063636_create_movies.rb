class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.integer :director_id, index: true
      t.decimal :avg_rating, precision: 3, scale: 1, default: 0.0

      t.timestamps
    end
  end
end

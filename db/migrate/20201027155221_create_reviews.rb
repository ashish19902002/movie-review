class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :rating
      t.string :content

      t.timestamps
    end
    add_index :reviews, [:movie_id, :user_id], unique: true
  end
end

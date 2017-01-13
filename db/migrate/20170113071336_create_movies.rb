class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :tagline
      t.string :status
      t.date :release_date
      t.string :language, :limit => 2, :null => false
      t.string :imdb_id
      t.integer :themoviedb_id
      t.integer :budget, :size => 5
      t.string :backdrop_path
      t.boolean :adult
      t.integer :revenue, :size => 5
      t.integer :runtime
      t.boolean :video
      t.decimal :vote_average
      t.integer :vote_count
      t.text :overview
      t.timestamps
    end
  end
end

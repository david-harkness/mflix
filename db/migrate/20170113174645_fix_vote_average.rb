class FixVoteAverage < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :vote_average, :float
  end
end

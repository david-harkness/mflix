class Movie < ApplicationRecord
  validates :language, :length => {is:2}
  validates :backdrop_path, :presence => true
  validates :themoviedb_id, :uniqueness => true

  # Available Sizes
  # ["w300", "w780", "w1280", "original"]
  def backdrop_poster_m
    base_url('w300')
  end

  private
  # TODO:  Use moviedb config instead of hard coded url
  def base_url(size)
    "http://image.tmdb.org/t/p/#{size}#{backdrop_path}"
  end
end

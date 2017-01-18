class Movie < ApplicationRecord
  validates :language, :length => {is:2}
  validates :backdrop_path, :presence => true
  validates :themoviedb_id, :uniqueness => true

  scope :title_search, -> (title) {
        where("title like ?", "%#{title}%").
        where.not(backdrop_path: nil).   # Ignore things without backgrounds...
        where(adult:false).limit(9)
  }

  # Perhaps some kaminari?
  scope :page, -> (i) {
    offset(9*(([i.to_i,1].max - 1))) # page 0 / 1 are the same
  }

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

class MovieSearchService
  attr :results
  class << self
    def search(movie)
      self.new(movie)
    end
  end


  def initialize(movie)
    search = Tmdb::Search.new
    search.resource('movie')
    search.query(movie)
    @results = search.fetch
    sync_movies
  end

  private
  def save_movie(m)
    movie = Movie.create({
      title: m['title'],
      tagline: m['tagline'],
      status: m['status'],
      release_date: m['release_date'],
      language: m['original_language'],
      backdrop_path: m['backdrop_path'],
      vote_average: m['vote_average'],
      overview: m['overview'],
      adult: m['adult'],
      themoviedb_id: m['id']
      }
    )
    begin
      # Not everything includes a background
      # Poormans way of dealing with this for now
      # TODO: Save anyway, put better logic elsewhere
      movie.save!
    rescue
      Rails.logger.debug("Movie Failed to Save: \n #{m}")
    end

  end

  def sync_movies
    # TODO: Change to single query by id
    @results.each do |movie|
      m = Movie.where(:themoviedb_id => movie['id']).first
      save_movie(movie) if m.nil?
    end
  end

end
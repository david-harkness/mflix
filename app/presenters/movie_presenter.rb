class MoviePresenter
  def initialize(movie)
    @movie = movie
  end

  def view
    {
        id: @movie.id,
        title: @movie.title,
        overview: @movie.overview,
        vote_average: @movie.vote_average,
        release_date: @movie.release_date,
        backdrop_path_m: @movie.backdrop_poster_m
    }
  end
end
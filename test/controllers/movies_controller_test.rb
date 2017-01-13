require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { adult: @movie.adult, backdrop_path: @movie.backdrop_path, budget: @movie.budget, imdb_id: @movie.imdb_id, language: @movie.language, overview: @movie.overview, release_date: @movie.release_date, revenue: @movie.revenue, runtime: @movie.runtime, status: @movie.status, tagline: @movie.tagline, themoviedb_id: @movie.themoviedb_id, title: @movie.title, video: @movie.video, vote_average: @movie.vote_average, vote_count: @movie.vote_count } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { adult: @movie.adult, backdrop_path: @movie.backdrop_path, budget: @movie.budget, imdb_id: @movie.imdb_id, language: @movie.language, overview: @movie.overview, release_date: @movie.release_date, revenue: @movie.revenue, runtime: @movie.runtime, status: @movie.status, tagline: @movie.tagline, themoviedb_id: @movie.themoviedb_id, title: @movie.title, video: @movie.video, vote_average: @movie.vote_average, vote_count: @movie.vote_count } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end

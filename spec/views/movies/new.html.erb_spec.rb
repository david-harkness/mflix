require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :status => "MyString",
      :overview => "MyText",
      :language => "MyString",
      :imdb_id => "MyString",
      :themoviedb_id => 1,
      :budget => 1,
      :backdrop_path => "MyString",
      :adult => false,
      :revenue => 1,
      :runtime => 1,
      :tagline => "MyString",
      :video => false,
      :vote_average => "9.99",
      :vote_count => 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "input#movie_status[name=?]", "movie[status]"

      assert_select "textarea#movie_overview[name=?]", "movie[overview]"

      assert_select "input#movie_language[name=?]", "movie[language]"

      assert_select "input#movie_imdb_id[name=?]", "movie[imdb_id]"

      assert_select "input#movie_themoviedb_id[name=?]", "movie[themoviedb_id]"

      assert_select "input#movie_budget[name=?]", "movie[budget]"

      assert_select "input#movie_backdrop_path[name=?]", "movie[backdrop_path]"

      assert_select "input#movie_adult[name=?]", "movie[adult]"

      assert_select "input#movie_revenue[name=?]", "movie[revenue]"

      assert_select "input#movie_runtime[name=?]", "movie[runtime]"

      assert_select "input#movie_tagline[name=?]", "movie[tagline]"

      assert_select "input#movie_video[name=?]", "movie[video]"

      assert_select "input#movie_vote_average[name=?]", "movie[vote_average]"

      assert_select "input#movie_vote_count[name=?]", "movie[vote_count]"
    end
  end
end

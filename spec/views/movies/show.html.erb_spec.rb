require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "Title",
      :status => "Status",
      :overview => "MyText",
      :language => "en",
      :imdb_id => "Imdb",
      :themoviedb_id => 2,
      :budget => 3,
      :backdrop_path => "Backdrop Path",
      :adult => false,
      :revenue => 4,
      :runtime => 5,
      :tagline => "Tagline",
      :video => false,
      :vote_average => "9.99",
      :vote_count => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/en/)
    expect(rendered).to match(/Imdb/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Backdrop Path/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Tagline/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/6/)
  end
end

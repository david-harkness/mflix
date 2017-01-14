describe "Movies Search" do
  before(:each) do
    @movie =  Movie.create!(
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
    )
  end
  it 'Searches Movies' do
    @movie.save!


    get "/api/v1/movies/#{@movie.id}.json"

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['title']).to eq('Title')
  end
end
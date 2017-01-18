class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    # TODO: Pagination
    @movies = Movie.all.map {|x| MoviePresenter.new(x).view}
    respond_to do |format|
      format.json { render :json => @movies}
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    render :json => MoviePresenter.new(@movie).view
  end

  def search
    params.permit(:title)
    params.permit(:page)

    search_by_title
    if @movies.size < 9  # Sync to Movies if less than 9 results
      MovieSearchService.search(params[:title]) # NOTE: This is a blocking call
      search_by_title # Try again.
    end

    respond_to do |format|
      format.json { render :json => @movies}
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def search_by_title
      # TODO: Need a global rate limiter on this thing! (redis perhaps?)
      # Elastic Search would go well here...
      @movies = Movie.page(params[:page]).title_search(params[:title]).map {|x| MoviePresenter.new(x).view}
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :status, :overview, :release_date, :language, :imdb_id, :themoviedb_id, :budget, :backdrop_path, :adult, :revenue, :runtime, :tagline, :video, :vote_average, :vote_count)
    end
end

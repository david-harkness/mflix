class LandingController < ApplicationController
  def index
    @movies = Movie.order("RAND()").first(9).map {|x| MoviePresenter.new(x).view}
  end
end

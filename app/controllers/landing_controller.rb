class LandingController < ApplicationController
  def index
    @movies = Movie.limit(9).order('id desc').map {|x| MoviePresenter.new(x).view}
  end
end

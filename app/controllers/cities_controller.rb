class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new

  end

  def create
    authorize @city
    city = City.new(:name)
    city.titleize
    city.save!
    redirect_to 'cities_path'
  end
end

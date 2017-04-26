class CitiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new

  end

  def create
    @city = City.new(city_params)
    authorize @city
    city.titleize
    city.save!
    redirect_to 'cities_path'
  end

  def update
    @city = City.find(params[:id])
    authorize @city
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end

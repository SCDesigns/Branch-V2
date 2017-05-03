class CitiesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def create
    @city = City.find_or_create_by_name(city_params)
    if @city.save
        flash[:notice] = "City successfully created!"
        redirect_to 'cities_path'
    else
       render 'new'
     end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    authorize @city.update(city_params)
    if @city.save
      redirect_to @city
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:notice] = "City deleted."
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end

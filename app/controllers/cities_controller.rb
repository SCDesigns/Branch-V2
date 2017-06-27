class CitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @city = City.new
    @city.categories.build
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city
      flash[:success] = "City successfully created!"
    else
      flash[:alert] = "Error: City is blank or already exists."
      render :new
    end
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @city.to_json(:include => :categories) }
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    if @city.save
      redirect_to @city
      flash[:success] = "City successfully updated!"
    else
      flash[:alert] = "Error: City is blank or already exists."
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:error] = "City successfully deleted."
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :category_ids => [], :categories_attributes => [:name])
  end
end

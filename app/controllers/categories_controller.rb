class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.new
    @category.cities.build
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to '/'
      flash[:success] = "Category successfully created!"
    else
      flash[:alert] = "Error: Category is blank or already exists."
      render :new
    end
  end

  def index
      if params[:city_id]
        @city = City.find_by(id: params[:city_id])
        if @city.nil?
          redirect_to cities_path, alert: "Error: City not found"
        else
          @categories = @city.categories
        end
      else
        @categories = Category.all
      end
    end

  def show
    if params[:city_id].present?
      @city = City.find_by(id: params[:city_id])
      @category = Category.find(params[:id])
      @branches = Branch.where(:city_id => @city.id, :category_id => @category.id).all
      if @category.nil?
        redirect_to city_categories_path(@city), alert: "Error: Category not found"
      end
    else
      @category = Category.find(params[:id])
      @branches = Branch.where(:category_id => @category.id).all
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    if @category.save
      redirect_to cities_path
    else
      flash[:alert] = "Error: Category is blank or already exists."
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    flash[:notice] = "Category deleted."
    redirect_to cities_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :city_ids => [], :cities_attributes => [:name])
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:city_id]
      @city = City.find_by(id: params[:city_id])
      if @city.nil?
        redirect_to cities_path
        flash[:alert] = "City not found"
      else
        @categories = @city.categories
      end
    else
      @categories = Category.all
    end
  end

  def show
    if params[:city_id]
      @city = City.find(params[:city_id])
      @category = Category.find_by(id: params[:id])
      @branches = Branch.where(:city_id => @city.id, :category_id => @category.id).all
      if @category.nil?
        redirect_to city_categories_path(@city)
        flash[:alert] = "Category not found"
      end
    else
      @category = Category.find(params[:id])
    end
  end

  def new
    @category = Category.new
  end


  def create
    @city = City.find_by(id: params[:city_id])
    @category = Category.new(category_params)
    @category.save
    @city.categories << @category
    redirect_to city_path(@city)
    flash[:success] = "Category successfully created!"
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save!
      redirect_to city_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:error] = "Category deleted."
    redirect_to cities_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

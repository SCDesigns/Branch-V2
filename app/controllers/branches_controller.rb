class BranchesController < ApplicationController
  before_action :authenticate_user!

  def new
    @city = City.find_by(id: params[:city_id])
    @category = Category.find_by(id: params[:category_id])
    @branch = Branch.new
  end

  def create
    @city = City.find_by(id: params[:city_id])
    @category = Category.find_by(id: params[:category_id])
    @branch = Branch.new(branch_params)
    @branch.city = @city
    @branch.category = @category
    @branch.user = current_user
    if @branch.save
      redirect_to city_category_branch_path(@branch.city, @branch.category, @branch)
      flash[:success] = "Branch successfully created!"
    else
      flash[:alert] = "Error. Fields cannot be left blank"
      render :new
    end
  end

  def index
    @branches = Branch.where(:city_id => @city.id, :category_id => @category.id).all
  end

  def show
    if params[:city_id] && params[:category_id]
        @city = City.find_by(id: params[:city_id])
        @category = Category.find_by(id: params[:category_id])
        @branch = Branch.find_by(id: params[:id])
      if @category.nil?
        redirect_to city_categories_path(@city)
        flash[:alert] = "Category not found"
      end
    else
      @category = Category.find(params[:id])
    end
  end

  def edit
    @city = City.find_by(id: params[:city_id])
    @category = Category.find_by(id: params[:category_id])
    @branch = Branch.find(params[:id])
  end

  def update
    @city = City.find_by(id: params[:city_id])
    @category = Category.find_by(id: params[:category_id])
    @branch = Branch.find(params[:id])
    @branch.update(branch_params)
  if @branch.save
    redirect_to city_category_branch_path(@city, @category, @branch)
  else
    render :edit
  end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    flash[:error] = "Branch deleted."
    redirect_to cities_path
  end

  private
  def branch_params
    params.require(:branch).permit(:name, :organization, :date, :location, :info)
  end
end

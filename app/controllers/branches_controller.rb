class BranchesController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:city_id] && !City.exists?(params[:city_id])
      redirect_to cities_path, alert: "City not found"
    else
      @branch = Branch.new(city_id: params[:city_id])
    end
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
        flash[:notice] = "Branch successfully created!"
        redirect_to 'branches_path'
    else
        flash[:notice] = "Branch successfully created!"
       render 'new'
     end
  end

  def index
    if params[:city_id]
      @branches = City.find(params[:city_id]).branches
    else
      @branches = Branch.all
    end
  end

  def show
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])
    authorize @branch
    if @branch.update(branch_params)
      redirect_to @branch
    else
      render :edit
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    flash[:notice] = "Branch deleted."
    redirect_to city_category_path
  end

  private
  def branch_params
    params.require(:branch).permit(:name, :organization, :date, :location, :info, :branch_attributes => [:city, :category])
  end
end

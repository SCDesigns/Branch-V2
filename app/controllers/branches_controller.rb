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
    @branches = Branch.new(branch_params)
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

  private
  def branch_params
    params.require(:branch).permit(:name, :city, :organization, :date, :location, :info)
  end
end

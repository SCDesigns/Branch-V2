class BranchesController < ApplicationController
  def index
    @branches = Branch.all
  end

  def create
    @branches = Branch.new(branch_params)
  end

  def show
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])
    authorize @branch
  end

  private
  def branch_params
    params.require(:branch).permit(:name, :city, :organization, :date, :location, :info)
  end
end

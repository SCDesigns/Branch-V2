class BranchesController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    @branches = Branch.new(branch_params)
  end

  def index
    @branches = Branch.all
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

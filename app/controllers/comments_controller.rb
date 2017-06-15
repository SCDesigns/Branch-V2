class CommentsController < ApplicationController
  before_action :set_branch

  def index
    @comments = @branch.comments
    render :json => @comments
  end

  def create
    @comment = @branch.comments.create(comments_params)
    render :json => @comment
  end


  private
    def set_branch
      @branch = Branch.find_by(id: params[:branch_id])
    end

    def comments_params
      params.require(:comment).permit(:content)
    end
end

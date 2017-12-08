class CommentsController < ApplicationController
  before_action :set_branch

  def index
    @comments = @branch.comments
    render :json => @comments
  end

  def create
    @comment = @branch.comments.create(comments_params)
    respond_to do |f|
      if @comment.save
        f.html { redirect_to :back }
        f.json { render :json => @comment }
      else
        f.html { redirect_to :back }
        f.json { render layout: false }
      end
    end
  end


  private
    def set_branch
      @branch = Branch.find_by(id: params[:branch_id])
    end

    def comments_params
      params.require(:comment).permit(:content)
    end
end

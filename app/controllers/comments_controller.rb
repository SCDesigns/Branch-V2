class CommentsController < ApplicationController
  before_action :set_branch

  def index
    @comments = @branch.comments
    render :json => @comments
  end

  def create
    @comment = @branch.comments.create(comments_params)
    if @comment.save
      # I need to render something that just has the LI I want...
      # why not just create a comments/show view that shows the LI of one comment?
      # render 'comments/show', :layout => false
      render 'create.js', :layout => false
    else
      render "branches/show"
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

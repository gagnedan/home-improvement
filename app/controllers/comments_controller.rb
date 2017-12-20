class CommentsController < ApplicationController

	load_and_authorize_resource

	 def index
    @comments = Comment.all.accessible_by(current_ability)
  end

   def new
    #@comment = Comment.new
    @project = Project.find( params[:project_id] )
    @comment = @project.comments.new
  end

   def create
    @project = Project.find( params[:project_id] )
    @comment = @project.comments.new(comment_params)


    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
	  # Never trust parameters from the scary internet, only allow the white list through.
	  def comment_params
	    params.require(:comment).permit(:body, :project_id)
	  end
end

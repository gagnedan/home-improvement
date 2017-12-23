class CommentsController < ApplicationController

	before_action :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :comment, through: :project

	 def index
    @comments = Comment.all.accessible_by(current_ability)
  end

   def new
   end

   def create
    @project = Project.find( params[:project_id] )
    @comment = @project.comments.build(comment_params)
    @comment.user_id = current_user.id


    if @comment.save
      flash[:notice] = "Comment successfully created!"
      redirect_to projects_path
    else
      render :new
    end

  end

  private
	  # Never trust parameters from the scary internet, only allow the white list through.
	  def comment_params
	    params.require(:comment).permit(:body, :project_id, :user_id)
	  end
end

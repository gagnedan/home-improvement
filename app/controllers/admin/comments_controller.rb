class Admin::CommentsController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @comments = Comment.all
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to admin_comments_path
  end


  private
  
  private
    def comment_params
      params.require(:comment).permit(:body, :project_id, :user_id)
    end
end

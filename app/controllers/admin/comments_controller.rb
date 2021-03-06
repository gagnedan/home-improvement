class Admin::CommentsController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @comments = Comment.all.order(:id)
  end

  def edit

  end

  def update

    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      flash[:notice] = t("flash.message.comment.update")
      redirect_to admin_comments_path
    else
      render action: :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = t("flash.message.comment.destroy")
    redirect_to admin_comments_path
  end


  private
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end

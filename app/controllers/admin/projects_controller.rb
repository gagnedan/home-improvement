class Admin::ProjectsController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all.accessible_by(current_ability).order(:id)
    @comments = Comment.new
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to admin_projects_path
  end


  private
  
    def project_params
        params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status, :user_id)
    end
end

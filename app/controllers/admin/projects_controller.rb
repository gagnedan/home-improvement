class Admin::ProjectsController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all
  end

  def edit
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to admin_projects_path
  end

  def update

    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to admin_projects_path
    else
      render action: :edit
    end
  end

  private
  
    def project_params
        params.require(:project).permit(:name, :description)
    end
end

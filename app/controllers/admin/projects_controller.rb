class Admin::ProjectsController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all.order(:id)
  end

  def edit

  end

  def update

    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      flash[:notice] = t("flash.message.project.update")
      redirect_to admin_projects_path
    else
      render action: :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = t("flash.message.project.destroy")
    redirect_to admin_projects_path
  end

  private
  
    def project_params
        params.require(:project).permit(:name, :description)
    end
end

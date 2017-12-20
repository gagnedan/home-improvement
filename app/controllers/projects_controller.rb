class ProjectsController < ApplicationController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all.accessible_by(current_ability)
  end

  def show
    Project.includes(:comments).find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      flash[:notice] = "Project successfully created!"
      redirect_to @project
    else
      render :new
    end
  end

  def update
    if @project.update(project_update_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to @project
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to @project
  end

  private
  
    def project_params
        params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status, :user_id)
    end
    
    # User cannot edit a public project’s name or effort-level
    # (a project he is not owner of)
    def project_update_params
        if current_user.id == @project.user_id || current_user.role == "admin"
          params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status)
        else
          params.require(:project).permit(:description, :is_public, :status)
        end
    end
end

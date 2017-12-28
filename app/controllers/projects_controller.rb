class ProjectsController < ApplicationController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all.accessible_by(current_ability).order(:id)
    @comments = Comment.new
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
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    current_user_role = current_user.role
    current_user_id = current_user.id
    project_owner_id = @project.user_id

    puts params.inspect
    respond_to do |format|
      if @project.update(UserParams.build(params, current_user_role, current_user_id, project_owner_id))
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  class UserParams
    def self.build (params, current_user_role, current_user_id, project_owner_id)
      if current_user_role == "user" && current_user_id != project_owner_id  
          params.require(:project).permit(:description, :is_public, :status)
        else
          params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status)
        end
    end
  end


  private
  
    def project_params
        params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status, :user_id)
    end
end

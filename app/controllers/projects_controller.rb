class ProjectsController < ApplicationController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.accessible_by(current_ability)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    Project.includes(:comments).find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_update_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
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

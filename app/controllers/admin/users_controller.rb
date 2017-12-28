class Admin::UsersController < Admin::AdminController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.where(role: "user")
  end

  def destroy
    @user.destroy
    flash[:notice] = "User successfully deleted!"
    redirect_to admin_users_path
  end


  private
  
    def project_params
        params.require(:project).permit(:name, :description, :is_public, :estimated_effort, :actual_effort, :status, :user_id)
    end
end

class Admin::ApplicationController < ApplicationController
	before_action :check_authorized

	def check_authorized
    redirect_to projects_path unless current_user.role == "admin"
  end

end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


	rescue_from CanCan::AccessDenied do |exception|
			session[:last_page] = request.env['HTTP_REFERER']
    	render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end

	def after_sign_in_path_for(resource)
    	projects_path
	end


end

module ApplicationHelper

	def is_admin?
		if current_user.role == "admin"
			true
		else
			false
		end
	end
end

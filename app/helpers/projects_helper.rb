module ProjectsHelper
	def is_owner?
		if action_name == "edit" 
			if current_user.id == @project.user.id
				true
			else
				false
			end
		else
			true
		end
	end
end

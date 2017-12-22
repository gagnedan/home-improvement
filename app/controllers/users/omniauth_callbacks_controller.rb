class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	

	def facebook

		@user = User.sign_in_from_facebook(request.env['omniauth.auth'])

		if @user.persisted?

			sign_in_and_redirect @user, event: :authentications

		else

			redirect_to new_user_session_path
		end
	
	end

	  private

end
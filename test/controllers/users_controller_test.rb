require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	# L'administrateur du système
	setup do
    @admin = users(:admin)
    @luke = users(:luke)
    @leia = users(:leia)
    @public_project = projects(:public_project)
    @private_project = projects(:private_project)
  end

  test "administrator should sign in successfully" do
  	@admin.password = 123456
		sign_in @admin
		assert_equal flash[:notice], 'Signed in successfully.', 'Administrator authentication failed with a good password.'
	end

	test "user can create projet" do
  	ability = Ability.new(@luke)
  	assert ability.can?(:create, Project.new(:user => @luke))
	end


	test "user cannot edit public project name or effort level" do
		##
		# The implementation actually use Strong Parameter 
		# to control which attributes of a model can be update
		# based on a role
		
		# Send project_params to Project Controller : simulate form post
		# The Project we try to update is owned by leai and is public
		# Luke will try to update project name and effort level
		# The return params are a hash containing permit params
		params = ProjectsController::UserParams.build(project_params, @luke.role, @luke.id, @leia.id)
		
		# The return hash should not contains those keys
		# :name, :estimated_effort, and :actual_effort
		precense_of_name =  params.has_key? :name
		precense_of_estimated_effort =  params.has_key? :estimated_effort
		precense_of_actual_effort =  params.has_key? :actual_effort

		# Since :name, :estimated_effort, and :actual_effort should not
		# be in the hash params, precense_of_key should always be false

		precense_of_key = precense_of_name && precense_of_estimated_effort && precense_of_actual_effort

		# We make sure is false
		assert_equal false, precense_of_key
	end


	def project_params()
 
		project_params = ActionController::Parameters.new( project: {
			name: @public_project.name, 
			description: @public_project.description,
			is_public: @public_project.is_public,
			estimated_effort: @public_project.estimated_effort,
			actual_effort: @public_project.actual_effort,
			status: @public_project.status
			}).permit!
	end

	def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end

end
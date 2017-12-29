class Ability
  include CanCan::Ability

  def initialize(user)

     @current_user = user || User.new # for gues

    if !@current_user.role.nil?
      # appel la methode selon le role
      send(@current_user.role.downcase)
    end
  end

  def admin

    # Admin cannot create their own home-improvement project
    cannot [:create], Project
    # Admin can edit and update projet : see strong parameter for permit params
    can [:edit, :update], Project
    # Admin can read and destroy projet, comment and user
    can [:read, :destroy], [Project, Comment, User]
    # Admin can read and destroy projet and comment
    can [:edit], [Project, Comment]
  end

  def user 

    # Users will be able to create their own home-improvement project
    can [:create], Project

    # Users will see all public projects
    #can [:read, :edit, :update], Project, Project.where("is_public = ? or user_id = ?", true, @current_user.id)
    
    # Users will see all public projects or project they owned (public or not)
    can [:read, :edit, :update] , Project, Project.where("is_public = ? or user_id = ?", true, @current_user.id) do |project|
      project.is_public?
      user_id = @current_user.id
    end

    # Users cannot delete projects, comments or userss
    cannot [:destroy], [Project, Comment, User]

    # Users will be able to view a public project and its comments
    can [:read], Comment, project: { :is_public => true }

    # Users will be able to add a comment to a public project
    # Users will be able to comment on public projects
    can [:create], Comment, project: { :is_public => true }


  end
end

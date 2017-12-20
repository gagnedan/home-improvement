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
    can :manage, :all
  end

  def user 
    #can :manage, :all

    # Users will be able to create their own home-improvement project
    can [:create], Project

    # Users will see all public projects
    can [:read, :edit, :update], Project, { :is_public => true}

    # Users cannot delete projects
    cannot [:delete], Project

    # Users will be able to view a public project and its comments
    can [:read], Comment, project: { :is_public => true }

    # Users will be able to add a comment to a public project
    # Users will be able to comment on public projects
    can [:create], Comment, project: { :is_public => true }


  end
end

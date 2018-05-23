class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can [:read], [Course]
    elsif user.role?("admin")
       can :manage, :all

    else 
        set_permissions(user)         
     end
end

  def set_permissions(user)

user.role.permissions.each do |model|
       m1 = model.model_list.name.singularize 
    if m1.split("_").size > 1
        m4 = []
        m1.split("_").each do |m|
            m4.push(m.capitalize)
        end
       m2 =  m4.join("");
   else 
    m1 = model.model_list.name.singularize


    m2 = m1.capitalize
end
     if (model.is_create == true)
 can [:create], [m2.constantize]
    end
    if (model.is_update == true)
        can [:update], [m2.constantize]
    end

    if (model.is_read == true)
    can [:read], [m2.constantize]
    end
    if (model.is_destroy == true)
    can [:destroy] , [m2.constantize]
    end      
end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

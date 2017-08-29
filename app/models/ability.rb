class Ability             # model which tells the part of accessible to user depending upon their roles.
  include CanCan::Ability # Accessibilty is controlled using cancan

  def initialize(user)    # For handling access to certain modules using cancan gem
    user ||= User.new     # Guest user
    if user.superadmin?   # Super Admin can access all 
      can :manage, :all
  end
    if user.admin?     # Admin have limited access.It can read read and create user but deleting power is only to super admin
      can :manage, :all
      # can :read, Group
      # can :create, Group
      # can :read, Event
      # can :update, Group do |group|
      #   group.try(:user) == user
      # end
      # can :destroy, Group do |group|
      #   group.try(:user) == user
      # end
      # can :read, User
      # can :create, User
      
    end

    if user.regular?  # Regular user can only view Groups.It cant even access admin panel
      can :read, Group
      can :read, Event
    end
end
end
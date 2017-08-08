class Ability             # model which tells the part of accessible to user depending upon their roles.
  include CanCan::Ability # Accessibilty is controlled using cancan

  def initialize(user)    # For handling access to certain modules using cancan gem
    user ||= User.new     # Guest user
    if user.superadmin?   # Super Admin can access all 
      can :manage, :all
  end
    if user.admin?     # Admin have limited access.It can read read and create user but deleting power is only to super admin
      can :read, Item
      can :create, Item
      can :update, Item do |item|
        item.try(:user) == user
      end
      can :destroy, Item do |item|
        item.try(:user) == user
      end
      can :read, User
      can :create, User
      
    end

    if user.regular?  # Regular user can only view items.It cant even access admin panel
      can :read, Item
    end
end
end
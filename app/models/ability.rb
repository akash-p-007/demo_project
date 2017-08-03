class Ability
  include CanCan::Ability

  def initialize(user)    # For handling access to certain modules using cancan gem
    user ||= User.new     # Guest user
    if user.superadmin?   # Super Admin can access all
      can :manage, :all
    elsif user.admin?     # Admin have limited access
      can :read, Item
      can :create, Item
      can :update, Item do |item|
        item.try(:user) == user
      end
      can :destroy, Item do |item|
        item.try(:user) == user
      end
    elsif user.regular?  # Regular user can only view
      can :read, Item
    end
      end
end
class Group < ActiveRecord::Base
	has_many :memberships
  	has_many :users, through: :memberships, dependent: :destroy
    has_many :posts, :dependent => :destroy
    accepts_nested_attributes_for :memberships
    def owners
    	User.find(self.memberships.where(role: 'owner').map(&:user_id))
  	end
end

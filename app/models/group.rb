class Group < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy
  	has_many :users, through: :memberships
    has_many :posts, :dependent => :destroy
    def owners
    	User.find(self.memberships.where(role: 'owner').map(&:user_id))
  	end
end

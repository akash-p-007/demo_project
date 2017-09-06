class Group < ActiveRecord::Base

	has_many :memberships, :dependent => :destroy
	has_many :users, through: :memberships
	accepts_nested_attributes_for :memberships # this is donw for allowing nested form while creating new group for selecting members
  has_many :posts, :dependent => :destroy
  validates_presence_of :name

end

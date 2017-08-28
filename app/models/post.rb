class Post < ActiveRecord::Base
  belongs_to :user
  has_one :group, through: :user,:dependent => :destroy
end

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end

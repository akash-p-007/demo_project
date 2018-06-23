class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
<<<<<<< HEAD
	has_attached_file :image, styles: { medium: "300x300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
=======
	acts_as_commontable
	has_attached_file :image, styles: { :medium => "300x300>",:thumb => '50x50>', :preview => '270x270>'}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/                            
>>>>>>> 336620b3c55fef45f92e60a89b49ab2b73abc31a
end

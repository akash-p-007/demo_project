class UserMailer < ApplicationMailer
	layout 'mailer'
	def send_admin_mail(user)
		@user = user
		@admin = User.find(@user.invited_by_id)
		mail(:to => @admin.email , :from => @user.email, :subject =>"Invitation accepted" )
	end
end

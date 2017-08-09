class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all 						# all is Alias which will be called for facebook,google+ and twitter login 
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?          # if user is found then he is logged in otherwise redirected to registration page
			flash.notice = "Account Sccessfully authenticated."
		  sign_in_and_redirect user
		else
		 	session["devise.user_attributes"] = user.attributes
		 	redirect_to new_user_registration_url
		end 
	end
	def failure
		redirect_to root_path
	end
	
	alias_method :twitter, :all
	alias_method :facebook, :all
	alias_method :google_oauth2, :all
end

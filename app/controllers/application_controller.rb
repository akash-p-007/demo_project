class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_mailer_host, :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|  # denying access until user signs in
  flash[:error] = "Access denied!"
  redirect_to root_url
	end
	

	protected
		def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
		  devise_parameter_sanitizer.permit(:account_update,keys: [:name])
		  devise_parameter_sanitizer.permit(:accept_invitataion,keys: [:name])
		  devise_parameter_sanitizer.permit(:invite,keys: [:name,:approved])
		 # devise_parameter_sanitizer.permit(:invite,keys: [:approved])	
		end

	private
	 def set_mailer_host
	 	ActionMailer::Base.default_url_options[:host] = "localhost:3000"
	 end

	 def after_invite_path_for(resource)
	 	users_path
	 end
end


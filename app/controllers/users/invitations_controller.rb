class Users::InvitationsController < Devise::InvitationsController 
	authorize_resource :class => false, :only => :new
end	
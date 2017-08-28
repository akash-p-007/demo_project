class PostsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource

	def index
	end

	def create
		@post = @group.posts.build(post_params) #Find way to provide group id
		@post.user_id = current_user.id
		if @post.save
		  flash[:success] = "Post created!"
		  redirect_to root_url
		else
		  redirect_to root_url
		end
	end

end

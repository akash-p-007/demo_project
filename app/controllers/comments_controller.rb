class CommentsController < ApplicationController
	def create
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to group_post_path(@group,@post)
	end
	def destroy
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to group_post_path(@group,@post)
	end
end

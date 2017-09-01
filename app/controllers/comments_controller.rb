class CommentsController < ApplicationController 
	before_action :find_commentable

	def create

		member = Membership.where(user_id: current_user.id)
		@group = Group.find(params[:group_id])
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.Superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = @commentable.comments.create(comments_params)
		#@comment = @post.comments.create(comments_params)
		redirect_to group_post_path(@group,@post)
	end
	end

	def new
      @comment = @commentable.comments.new
    end
	def destroy
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.Superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to group_post_path(@group,@post)
	end
	end
	def edit
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.Superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		end
				render :layout => false

	end	
	def update
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.Superadmin?
		@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	if @comment.update(comments_params)
      		redirect_to group_post_path(@group,@post)
    	else
      		render 'edit'
    	end
    end
    	
	end
	private
    def comments_params
      params.require(:comment).permit(:name,:body,:post_id,:group_id,:id)
    end
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end

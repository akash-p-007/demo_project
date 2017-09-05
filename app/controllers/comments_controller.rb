class CommentsController < ApplicationController 
	before_action :find_commentable
	load_and_authorize_resource
	def create
		member = Membership.where(user_id: current_user.id)
		@group = Group.find(params[:group_id])
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = @group.posts.find(params[:post_id])
		if @commentable
		@comment = @commentable.comments.new comment_params
	else
		@comment = @post.comments.new comment_params
	end
		@comment.name = current_user.name
		@comment.save!
		if @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
    else
        redirect_to :back, notice: "Your comment wasn't posted!"
    end
	end
	end

	def new
      @comment = Comment.new
  end

	def destroy
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = Comment.find(params[:id]) #|| @comments.comments.find(params[:id])
		@comment.destroy
		redirect_to group_post_path(@group,@post)
	end
	end
	def edit
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		end
				render :layout => false

	end	
	def update
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	if @comment.update(comment_params)
      		redirect_to group_post_path(@group,@post)
    	else
      		render 'edit'
    	end
    end
    	
	end
	private
    def comment_params
      params.require(:comment).permit(:name,:body,:post_id,:group_id,:id)
    end
    def find_commentable
      @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    end
end

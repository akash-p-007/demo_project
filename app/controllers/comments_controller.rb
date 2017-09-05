class CommentsController < ApplicationController 

	def create
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
			@post = @group.posts.find(params[:post_id])
			# if params[:comment][:parent_id] != nil
   #  		@comment = Comment.find(params[:parent_id]).replies.new.(comments_params)
  	# 	elsif params[:comment][:parent_id] == nil
    		@comment = @post.comments.new(comments_params)
    		@comment.save
			redirect_to group_post_path(@group,@post)
		end
	end

	def new
    @comment = @post.comments.new
  end

  def show
  	@comments = @post.comments.find(params[:id])
  end

	def destroy
		@group = Group.find(params[:group_id])
		member = Membership.where(user_id: current_user.id)
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = @group.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		  respond_to do |format|
	   	format.html { redirect_to group_post_path(@group,@post), notice: 'Comment was successfully destroyed.' }   
	    end
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
    	if @comment.update(comments_params)
      		redirect_to group_post_path(@group,@post)
    	else
      		render 'edit'
    	end
  end
    	
	end
	private
    def comments_params
      params.require(:comment).permit(:name,:body,:post_id,:group_id,:id,:parent_id,:comment_id)
    end
    
end

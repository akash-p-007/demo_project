class PostsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource
	def index
		member = Membership.where(user_id: current_user.id)
		@group = Group.find(params[:group_id])
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post= Post.where(group_id: @group.id)
		end
	end

	def new
		@group = Group.find(params[:group_id])
		@post = Post.new
	end

	def create
		member = Membership.where(user_id: current_user.id)
		@group = Group.find(params[:group_id])
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
		@post = Post.new(post_params)

   		 @post.user_id = current_user.id
		@post.group_id = @group.id
		
		if @post.save
		  flash[:success] = "Post created!"
		  redirect_to group_posts_path
		else
		  render 'new'
		end
		end
	end

	def show
		member = Membership.where(user_id: current_user.id)
		@group = Group.find(params[:group_id])
		if (@group.is_public) || (member.where(group_id: @group.id).present?) || current_user.superadmin?
	    @post = Post.find(params[:id])
	end
	end

	def edit
		render :layout => false
	end

	def update
    	respond_to do |format|
    	  if @post.update(post_params)
        	format.html { redirect_to group_posts_url, notice: 'Post was successfully updated.' }
      	  else
        	format.html { render :edit }
          end
  	  end
  	end
	def destroy 
	   if current_user == @post.user
	   @post.destroy
	   respond_to do |format|
	   	format.html { redirect_to group_posts_url, notice: 'Post was successfully destroyed.' }   
	   end
	   else
	   	redirect_to groups_url, :flash => { :error => "Post owner can only delete post" }   
	   end	 
	end
	
	private
    def post_params
      params.require(:post).permit(:title,:body, :group_id, :user_id)
    end

end

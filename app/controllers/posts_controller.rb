class PostsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource


	def index
		@group = Group.find(params[:group_id])
		@post= Post.where(group_id: @group.id)
	end

	def new
		@group = Group.find(params[:group_id])
		@post = Post.new
	end

	def create
		@group = Group.find(params[:group_id])
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

	def show
		@group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
	end

	def edit
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end		
	end

	private
    def post_params
      params.require(:post).permit(:title,:body, :group_id, :user_id)
    end

end

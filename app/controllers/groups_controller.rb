class GroupsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

	def index
    @member = Membership.where(user_id: current_user.id)
    #@groups = Group.all
    if current_user.superadmin?
      @groups = Group.all
    else 
      @groups = current_user.groups
    end
	end

	def new
	end

	def show 
		@members = Membership.all 
		@users = User.all
		render :layout => false
	end
		 
	def create                            
  	respond_to do |format|
      if @group.save 
      	@group.users << current_user
        format.html { redirect_to add_members_group_path(@group), notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

	def update
		respond_to do |format|
		@group = Group.find(params[:group_id])  
		@user = User.find(params[:user_id]) 
		@group.users << @user unless @group.users.include? @user 
    	format.html { redirect_to add_members_group_path(@group), notice: 'Member was successfully Added.' }
    end
	end

	def remove_member # this will remove members from the group member list after the creation of the group is done
		@group = Group.find(params[:group_id])  
		@user = User.find(params[:user_id])
    respond_to do |format|
    member = Membership.where(user_id:@user.id,group_id:@group.id)
  	Membership.delete(member)
    format.html { redirect_to add_members_group_path(@group), notice: 'Member was successfully destroyed.' }
    pend
	end
end

	def add_members
		@users = User.all 
	end
	
	def destroy # for destroying complete group
      @group.destroy
      respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
     end
  end

	private
    def group_params
      params.require(:group).permit(:name,:desc,:created_by,:is_public)
    end
end


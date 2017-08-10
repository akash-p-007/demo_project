class UsersController < ApplicationController # controller for handling users.
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index                                   #if user is permitted by admin then only it gets access
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

  def show                                    # show details of particular user                          
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  def new
  end

  def edit
  end

  def create                            #for creating new user 
    respond_to do |format|
      if @user.save
        #User.invite!(:email => @user.email, :name=> @user.name) 
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update                          #for updating the details of an existing user
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js  
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def unapproved
      @user = User.find(params[:id])
      respond_to do |format|
      if (params[:approved] == "true")
        @user.update(approved: true)
         format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js 
       else
        @user.update(approved: false)
        format.js
      end
    end
    #@users = User.where(approved: false) 
   # format.js {render :file => "unapproved.js.erb"} 
  end

  def destroy                         # deleting user permanently
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def needs_password?(user, params)
      params[:password].present?
    end
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id, :approved)
    end
end

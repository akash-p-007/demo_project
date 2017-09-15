class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!           #user should authorise to get access
  
  def index             
  end

  def show                                   
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :user_id)
    end
end

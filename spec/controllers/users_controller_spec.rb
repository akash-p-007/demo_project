require 'rails_helper'
require 'support/controller_macros'
RSpec.describe  UsersController, :type => :controller do 

  
  describe 'GET #new' do
    it "requires login" do
      FactoryGirl.create(:group)
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET #index" do
    login_user
    
    it "do not render edit user" do
      expect(:get => 'edit/1'). 
      not_to render_with_layout 
    end

    it "do not render show user" do
      expect(:get => 'show/1'). 
      not_to render_with_layout 
    end

    it "renders the index template" do
      get :index
      expect(response).to redirect_to root_path
    end
    
    it "matches the index of users" do
      expect(:get => '/admin/users').to route_to("format"=>"html", "controller"=>"users", "action"=>"index")
    end
    
  end
end    
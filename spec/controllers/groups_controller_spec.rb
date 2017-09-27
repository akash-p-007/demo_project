require 'rails_helper'
require 'support/controller_macros'
RSpec.describe  GroupsController, :type => :controller do 

  describe "GET #index" do
  	login_user
  	it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  	
  	it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "matches the index of groups" do
      expect(:get => '/groups').to route_to(:controller => "groups", :action => "index")
    end

    it "loads all of the groups into @groups" do
      group1, group2 = FactoryGirl.create(:group), FactoryGirl.create(:group)
      get :index
      expect(assigns(:group)).to match_array([group1, group2])
    end


    # context "with invalid attributes" do
    
    #   it "does not save the new group" do
    #     expect{
    #       post :create, group: FactoryGirl.attributes_for(:invalid_group)
    #     }.to_not change(Group, :count)
    #   end
     
    #   it "re-renders the new method" do
    #     post :create, group: FactoryGirl.attributes_for(:invalid_group)
    #     expect(response).to render_template("new")
    #   end

    # end


  end

  # describe "GET #show" do
  #   it "assigns the requested group to @group" do
  #     group = FactoryGirl.create(:group)
  #     get :show, id: group
  #     assigns(:group).should eq(group)
  #   end
  #   it "renders the #show view" do
  #     get :show, id: FactoryGirl.create(:group)
  #     expect(response).to render_template("show")
  #   end
  # end

  # describe 'DELETE destroy' do
  #   before :each do
  #     @group = FactoryGirl.create(:group)
  #   end
  #   it "deletes the group" do
  #     expect{
  #       delete :destroy, id: @group        
  #     }.to change(Group,:count).by(-1)
  #   end
  #   it "redirects to groupss#index" do
  #     delete :destroy, id: @group
  #     expect(response).to redirect_to (groups_url)
  #   end
  # end

end  


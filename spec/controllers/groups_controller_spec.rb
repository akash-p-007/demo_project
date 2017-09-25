require 'rails_helper'
# include Devise::Test::ControllerHelpers
describe  GroupsController do 
  describe "GET #index" do
    it "matches the index of groups" do
      expect(:get => '/groups').to route_to(:controller => "groups", :action => "index")
    end
    context "with invalid attributes" do
      it "does not save the new group" do
        expect{
          post :create, group: FactoryGirl.attributes_for(:invalid_group)
        }.to_not change(Group, :count)
      end
      it "re-renders the new method" do
        post :create, group: FactoryGirl.attributes_for(:invalid_group)
        response.should render_template :new
      end
    end 
  end

  describe "GET #show" do
    it "assigns the requested group to @group" do
      group = FactoryGirl.create(:group)
      get :show, id: group
      assigns(:group).should eq(group)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:group)
      response.should render_template :show
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @group = FactoryGirl.create(:group)
    end
    it "deletes the group" do
      expect{
        delete :destroy, id: @group        
      }.to change(Group,:count).by(-1)
    end
    it "redirects to groupss#index" do
      delete :destroy, id: @group
      response.should redirect_to groups_url
    end
  end

end  


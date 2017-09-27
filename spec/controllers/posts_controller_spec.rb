require 'rails_helper'

describe  PostsController do 

  describe "POST #create" do  
    context "with valid attributes" do
      it "should redirect to index with notice on successful save" do
        expect{
        post :create, post: FactoryGirl.attributes_for(:post)
      }.to change(Post,:count).by(1)
      end  
    end  
  end  
      
  describe "GET #index" do
    it "populates an array of posts" do
    	FactoryGirl.create(:group)
      post = FactoryGirl.create(:post)
      get :index
      assigns(:post).should eq([post])
    end
    it "matches the routes" do

    	FactoryGirl.create(:group)
    	FactoryGirl.create(:post)  	
      expect(:get => '/groups/:group_id/posts(.:format)').to route_to(:format => "html", :controller => "posts", :action => "index", :group_id => "1")
     end
  end

end
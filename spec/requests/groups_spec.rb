require 'spec_helper'

describe "user settings" do
      before :all do
      let(:authed_user) { create_logged_in_user }
    end
   end 

describe "Groups" do
  describe "Manage groups" do

    it "Adds a new group and displays the results" do
      visit groups_path
       visit new_group_path
       click_button 'Create group'
    end
      
  end
end
require 'rails_helper'

RSpec.describe Group do
  
  it "is valid with a name and description" do
     group = FactoryGirl.build(:group)
    expect(group).to be_valid
  end
  it "is invalid without a name" do
    group = FactoryGirl.build(:group, name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end
  it "is invalid without a description" do
    group = FactoryGirl.build(:group, desc: nil)
    group.valid?
    expect(group.errors[:desc]).to include("can't be blank")
  end
  it "should have many users" do                 #Checking association group has many users
    t = Group.reflect_on_association(:users)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many posts" do                 #Checking association group has many post
    t = Group.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end
  
end

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with a name, email, and password" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("Name can't be blank")
  end
  
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("Please enter a valid email id")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "Joe Tribbyani",
      email:"tester@example.com",
      password:"dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
      name: "Ross Gellar",
      email:"tester@example.com",
      password:"dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  it "returns a user's full name as a string" do
    user = User.new(
      name: "Chandler Bing",
      email:"johndoe@example.com",
    )
    expect(user.name).to eq "Chandler Bing"
  end

  it "should have many groups" do                 #Checking association user has many groups
    t = User.reflect_on_association(:groups)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many posts" do                 #Checking association user has many posts
    t = User.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many events" do                 #Checking association user has many events
    t = User.reflect_on_association(:events)
    expect(t.macro).to eq(:has_many)
  end
  it "should belong to role" do                 #Checking association belongs to role
    t = User.reflect_on_association(:role)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should belong to group" do                 #Checking association user belongs to group
    t = User.reflect_on_association(:group)
    expect(t.macro).to eq(:belongs_to)
  end

end
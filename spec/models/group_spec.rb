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
  
  #  it "does not allow duplicate group names per user" do
  #   user = User.create(
  #     name: "Joey Tester",
  #     email:"joetester@example.com",
  #     password:"dottle-nouveau-pavilion-tights-furze",
  #   )
  #   user.groups.create(
  #     name: "Test Group",
  #   )
  #   new_group = user.groups.build(
  #   name: "Test Group",
  #   )
  #   new_group.valid?
  #   expect(new_group.errors[:name]).to include("has already been taken")
  # end

end
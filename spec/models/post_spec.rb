require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "is valid with a title and body" do
    post = Post.new(
    title: "Aron Sumner",
    body:"dottle-nouveau-pavilion-tights-furze",
    )
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = Post.new(
    title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end
  
end  
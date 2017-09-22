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
  
  it "cant have nil comments" do
    post = Post.new(title:"abcdef",body:"dottle-nouveau-pavilion-tights-furze",)
    post.save!
    comment = post.comments.create!(body: nil)
    comment.valid?
  end
  

  it "orders them in chronologically" do
    post = Post.new(title:"abcdef",body:"dottle-nouveau-pavilion-tights-furze",)
    post.save!
    comment1 = post.comments.create!(:body => "first comment")
    comment2 = post.comments.create!(:body => "second comment")
    expect(post.reload.comments).to eq([comment1, comment2])
  end

end  
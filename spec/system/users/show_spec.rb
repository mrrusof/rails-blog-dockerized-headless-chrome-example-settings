
require 'rails_helper'

RSpec.describe 'show user profile', type: :system do
  before(:each) do
    @user1 = User.create(:username => "Andrew", :email => "achalkley@example.com") 
    @user2 = User.create(:username => "Matt", :email => "mtardivo@example.com") 

    @post = Post.create(:user => @user1, :title => "My Blog Post", :body => "Hello world!\n\nThis is my first blog post.")
  end

  scenario 'show posts for user on their profile page' do
    visit user_path(@user1)
    expect(page).to have_content("My Blog Post")
    expect(page).to have_content("By: Andrew")
    expect(page).to have_content("Hello world!...")
    expect(page).to_not have_content("This is my first blog post.")
  end

  scenario 'hide email address' do 
    visit user_path(@user1)
    expect(page).to have_content("achalkley@*******.com")
  end

  scenario 'user has no posts' do 
    visit user_path(@user2)
    expect(page).to have_content("No Posts")
  end
end

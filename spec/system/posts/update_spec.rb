
require 'rails_helper'

RSpec.describe 'update a post', type: :system do
  before(:each) do
    @user1 = User.create(:username => "Andrew", :email => "achalkley@example.com") 
    @user2 = User.create(:username => "Matt", :email => "mtardivo@example.com") 

    @post = Post.create(:user => @user1, :title => "My Blog Post", :body => "Hello world!\n\nThis is my first blog post.")
  end

  scenario 'edit author' do
    expect(Post.count).to eq(1)

    # Go to edit page
    visit edit_post_path(@post)

    # Edit the post
    select 'Matt', from: 'post[user_id]'
    click_button 'Update Post'

    expect(Post.count).to eq(1)
    expect(page).to have_content("By: Matt")

    # Go back to edit the post
    click_link 'Edit'
    fill_in 'Title', with: ''
    click_button 'Update Post'

    expect(Post.count).to eq(1)
    expect(page).to have_content("Title can't be blank")
  end
end

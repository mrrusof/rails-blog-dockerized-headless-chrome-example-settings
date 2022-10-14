
require 'rails_helper'

RSpec.describe 'create a post', type: :system do
  before(:each) do
    User.create(:username => "Matt", :email => "mtardivo@example.com") 
    User.create(:username => "Andrew", :email => "achalkley@example.com") 
  end
  scenario 'empty title and body' do
    visit new_post_path
    click_button 'Create Post'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")

    expect(Post.count).to eq(0)
  end

  
  scenario 'complete title and body present' do
    visit new_post_path
    select "Andrew", from: "post[user_id]"
    fill_in "Title", with: "My Blog Post"
    fill_in "Body", with: "Hello world!\n\nThis is my first blog post."
    click_button 'Create Post'

    expect(page).to have_content("My Blog Post")
    expect(page).to have_content("By: Andrew")
    expect(page).to have_content("This is my first blog post.")

    expect(Post.count).to eq(1)

    # Go to home page
    click_link 'Back'
    
    expect(page).to have_content("My Blog Post")
    expect(page).to have_content("By: Andrew")
    expect(page).to have_content("Hello world!...")
    expect(page).to_not have_content("This is my first blog post.")

    # Go back to the blog post
    click_link 'My Blog Post'

    expect(page).to have_content("My Blog Post")
    expect(page).to have_content("By: Andrew")
    expect(page).to have_content("This is my first blog post.")
  end

end

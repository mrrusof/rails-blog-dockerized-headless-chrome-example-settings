
require 'rails_helper'

RSpec.describe 'delete a post', type: :system do
  before(:each) do
    User.create(:username => "Andrew", :email => "achalkley@ebay.com") 
  end

  scenario 'deleting a post', js: true do
    visit new_post_path
    fill_in "Title", with: "My Blog Post"
    fill_in "Body", with: "Hello world!\n\nThis is my first blog post."
    click_button 'Create Post'

    expect(Post.count).to eq(1)

    # Go to home page
    click_link 'Back'
    expect(page).to have_content("My Blog Post");

    # Delete the post
    accept_confirm do
        click_link 'Destroy'
    end
    visit posts_path
    expect(page).not_to have_content("My Blog Post");

  end

end

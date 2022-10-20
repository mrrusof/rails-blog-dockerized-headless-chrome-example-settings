
require 'rails_helper'

RSpec.describe 'delete a user', type: :system do
  before(:each) do
    User.create(:username => "Andrew", :email => "achalkley@example.com") 
  end

  scenario 'deleting a user', js: true do
    expect(User.count).to eq(1)

    visit users_path
    expect(page).to have_content("Andrew");

    accept_confirm("Are you sure?") do
        click_link 'Destroy'
    end
    visit users_path
    expect(page).not_to have_content("Andrew");
  end

end

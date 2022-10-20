
require 'rails_helper'

RSpec.describe 'update a user', type: :system do
    before(:each) do
      @user = User.create(:username => "Andrew", :email => "achalkley@example.com") 
  end

  scenario 'edit author' do
    expect(User.count).to eq(1)

    # Go to edit page
    visit edit_user_path(@user)

    # Edit the user
    fill_in 'Username', with: 'Andres'
    click_button 'Update User'

    expect(User.count).to eq(1)
    expect(page).not_to have_content('Andrew')
    expect(page).to have_content('Andres')

    # Go back to edit the user
    click_link 'Edit'
    fill_in 'Username', with: ''
    click_button 'Update User'

    expect(User.count).to eq(1)
    expect(page).to have_content("Username can't be blank")
  end
end

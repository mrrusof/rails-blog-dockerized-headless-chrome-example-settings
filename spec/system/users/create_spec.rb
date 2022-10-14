
require 'rails_helper'

RSpec.describe 'create a user', type: :system do
  scenario 'empty username and email' do
    visit new_user_path
    click_button 'Create User'

    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Email can't be blank")

    expect(User.count).to eq(0)
  end

  scenario 'invalid email' do
    visit new_user_path
    fill_in "Username", with: "Andrew"
    fill_in "Email", with: "invalid@email"
    click_button 'Create User'

    expect(page).to have_content("Email is invalid")

    expect(User.count).to eq(0)
  end

  scenario 'valid user details' do
    visit new_user_path
    fill_in "Username", with: "Andrew"
    fill_in "Email", with: "achalkley@example.com"
    click_button 'Create User'

    expect(page).to have_content("User was successfully created.")
    expect(page).to have_content("Andrew")
    expect(page).to have_content("achalkley@*******.com")

    expect(User.count).to eq(1)
  end
end
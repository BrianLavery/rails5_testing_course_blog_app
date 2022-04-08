require 'rails_helper'

RSpec.feature 'Signing out signed in users' do
  before do
    @john = User.create(email: "john@example.com", password: "password")

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario "Signing user out" do
    visit root_path
    click_link "Logout"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Sign out")
  end
end

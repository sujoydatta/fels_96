require "rails_helper"

feature "After signs out" do
  before :each do
    user = double("user", name: "example", email: "example@zxc.com", password: "password")
    visit new_user_registration_path
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button I18n.t "sign_up_now"
    click_link I18n.t "logout"
  end

  scenario "Sign out link should disappear" do
    expect(page).not_to have_link I18n.t "logout"
  end

  scenario "Sign in link should appear" do
    expect(page).to have_link I18n.t "login"
  end

  scenario "Sign up link should appear" do
    expect(page).to have_link I18n.t "sign_up_now"
  end

  scenario "Category link should disappear" do
    expect(page).not_to have_link I18n.t "category"
  end

  scenario "Word link should disappear" do
    expect(page).not_to have_link I18n.t "words"
  end
end

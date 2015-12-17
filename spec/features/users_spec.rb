require "rails_helper"

describe "Users" do
  let(:user){FactoryGirl.create :user}
  it "Creates a new account and displays root path" do
    visit new_user_registration_path
    expect{
      fill_in "Name", with: "John"
      fill_in "Email", with: "john@abc.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button I18n.t "sign_up_now"
    }.to change(User,:count).by 1

    expect(page).to have_content I18n.t "devise.registrations.signed_up"
    expect(page).to have_content I18n.t "welcome_message"
  end

  it "Shows error for invalid signup" do
    visit new_user_registration_path
    expect{
      fill_in "Name", with: "John"
      fill_in "Email", with: "john@abc.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password12"
      click_button I18n.t "sign_up_now"
    }.to change(User,:count).by 0

    expect(page).not_to have_content I18n.t "devise.registrations.signed_up"
    expect(page).to have_content I18n.t "sign_up_now"
  end

  it "Log in if valid credential" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
    save_page
    expect(page).to have_content I18n.t "devise.sessions.signed_in"
    expect(page).to have_selector :link_or_button, I18n.t(:notification)
  end

  it "Show error if invalid credential" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "vulpassword"
    click_button I18n.t "login"
    save_page
    expect(page).to have_content "Invalid email or password."
    expect(page).to have_content I18n.t "forgot_password"
  end
end

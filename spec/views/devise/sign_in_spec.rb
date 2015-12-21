require "rails_helper"

describe User, "sign in" do
  feature "sign in" do
    let!(:user) {FactoryGirl.create :user}

    scenario "Log in as valid user." do
      visit "users/sign_in"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Login"

      expect(page).to have_content "Signed in successfully."
    end

    scenario "Log in with invalid email or password" do
      visit "/users/sign_in"
      fill_in "user_email", with: "Batman@gotham.com"
      fill_in "user_password", with: "123456"
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end
end

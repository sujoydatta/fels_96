describe User, "sign up" do
  feature "sign up" do
    let!(:user) {FactoryGirl.create :user}

    scenario "Successful sign up" do
      visit "/users/sign_up"
      fill_in "user_name", with: "Batman"
      fill_in "user_email", with: "Batman@gotham.com"
      fill_in "user_password", with: "12345678"
      fill_in "user_password_confirmation", with: "12345678"
      click_button "Sign up"

      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "Sign up failed with email already exit." do
      visit "users/sign_up"
      fill_in "user_name", with: user.name
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password_confirmation
      click_button "Sign up"

      expect(page).to have_content "Email has already been taken"
    end
  end
end

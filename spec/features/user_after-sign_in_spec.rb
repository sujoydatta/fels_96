require "rails_helper"

feature "User after signs in" do
  let(:user){FactoryGirl.create :user}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
  end

  scenario "Categories link should appear" do
    expect(page).to have_link I18n.t "categories", href: categories_path
  end

  scenario "Words link should appear" do
    expect(page).to have_link I18n.t "words", href: words_path
  end

  scenario "Lessons taken link should appear" do
    expect(page).to have_link I18n.t "lessons_taken", href: lessons_path
  end

  scenario "Sign Up link should disappear" do
    expect(page).not_to have_link I18n.t "sign_up_now"
  end

 scenario "Sign In link should disappear" do
    expect(page).not_to have_link I18n.t "login"
  end

  scenario "Log out link should appear" do
    expect(page).to have_link I18n.t "logout"
  end
end

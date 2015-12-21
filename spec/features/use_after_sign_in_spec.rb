require "rails_helper"

feature "Admin after signs in" do
  let(:user){FactoryGirl.create :admin}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
  end

  scenario "Categories link should appear" do
    click_link I18n.t "category"
    expect(page).to have_link I18n.t "add_new", href: new_admin_category_path
    expect(page).to have_link I18n.t "view_all", href: admin_categories_path
  end

  scenario "Words link should appear" do
    click_link I18n.t "word"
    expect(page).to have_link I18n.t "add_new", href: new_admin_word_path
    expect(page).to have_link I18n.t "view_all", href: admin_words_path
  end

  scenario "Lessons taken link should disappear" do
    expect(page).not_to have_link I18n.t "lessons_taken"
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

require "rails_helper"

feature "Add word" do
  let(:user){FactoryGirl.create :user, admin: true}
  let!(:category){FactoryGirl.create :category}
  let!(:lesson){FactoryGirl.create :lesson, user_id: user.id, category_id: category.id}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
    visit  new_admin_word_path
  end

  scenario "Words header should appear" do
    expect(page).to have_text I18n.t "add_word_text"
  end

  scenario "categories should appear" do
    expect(page).to have_select "word_category_id", options: [category.name]
  end

  scenario "Content text should appear" do
    expect(page).to have_text I18n.t "content"
  end

    scenario "Add option link should appear" do
      expect(page).to have_link I18n.t "add_option"
    end

  scenario "Add word button should appear" do
    expect(page).to have_text I18n.t "add_word_text"
  end

  scenario "add word feature", js: true do
    click_link I18n.t "add_option"
    expect(page).to have_link I18n.t "add_option"
    expect(page).to have_text I18n.t "remove_option"
    fill_in "Content", with: "contentcontent"
    click_button I18n.t "add_word_text"
    expect(page).to have_text I18n.t "add_word_sucessful_message"
  end
end

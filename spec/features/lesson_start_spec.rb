require "rails_helper"

feature "Starting lesson" do
  let(:user){FactoryGirl.create :user}
  let!(:category){FactoryGirl.create :category}
  let!(:lesson){FactoryGirl.create :lesson, user_id: user.id, category_id: category.id}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
    click_link I18n.t "categories"
  end

  scenario "Categories header should appear" do
    expect(page).to have_text I18n.t "all_categories"
  end

  scenario "all categories should appear" do
    expect(page).to have_text category.name
  end

  scenario "lesson start button should appear" do
    expect(page).to have_button I18n.t "start_lesson"
  end

  scenario "start lesson text should appear" do
    click_button I18n.t "start_lesson"
    expect(page).to have_content I18n.t "lesson_started"
    expect(page).to have_text category.name
    expect(page).to have_button I18n.t "submit"
  end
end

require "rails_helper"

describe "Lessons" do
  let(:user){FactoryGirl.create :user}
  let(:lesson){FactoryGirl.create :lesson}

  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
    click_link I18n.t "lessons_taken"
  end

  it "has a title" do
    expect(page).to have_content I18n.t "lessons_taken"
  end
end

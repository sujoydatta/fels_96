require "rails_helper"

describe "Words" do
  let(:user){FactoryGirl.create :user}

  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "login"
    click_link I18n.t "words"
  end

  it "has a title" do
    expect(page).to have_content I18n.t "all_words"
  end

  it "has a search button" do
    expect(page).to have_button I18n.t "search"
  end

end

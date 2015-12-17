require "rails_helper"

describe Category do
  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
  end

  it {should validate_presence_of :name}
end

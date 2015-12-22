require "rails_helper"

describe Category do
  it "has a valid factory" do
    expect(FactoryGirl.create :category).to be_valid
  end

  it {should validate_presence_of :name}
end

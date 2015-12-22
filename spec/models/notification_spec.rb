require "rails_helper"

describe Notification do
  it "has a valid factory" do
    expect(FactoryGirl.create :notification).to be_valid
  end

  it {should belong_to :category}
end

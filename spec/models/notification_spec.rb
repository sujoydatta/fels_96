require "rails_helper"

describe Notification do
  it "has a valid factory" do
    FactoryGirl.create(:notification).should be_valid
  end

  it {should belong_to :category}
end

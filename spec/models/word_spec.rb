require "rails_helper"

describe Word do
  it "has a valid factory" do
    FactoryGirl.create(:word).should be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:word, content: nil).should_not be_valid
  end
end

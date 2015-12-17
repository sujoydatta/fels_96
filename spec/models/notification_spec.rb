require "rails_helper"

describe Notification do
  it "has a valid factory" do
    FactoryGirl.create(:notification).should be_valid
  end

  it "belongs to a category" do
    t = Notification.reflect_on_association :category
    expect(t.macro).to eq :belongs_to
  end
end

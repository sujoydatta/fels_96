require "rails_helper"

describe Word do
  it "has a valid factory" do
    expect(FactoryGirl.create :word).to be_valid
  end

  it {should validate_presence_of :category_id}
  it {should validate_presence_of :content}
end

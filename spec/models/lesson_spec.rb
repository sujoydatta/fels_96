require "rails_helper"

describe Lesson do
  it "has a valid factory" do
    expect(FactoryGirl.create :lesson).to be_valid
  end

  it {should have_many :lesson_words}
  it {should belong_to :user}
  it {should belong_to :category}
  it {should accept_nested_attributes_for :lesson_words}
end

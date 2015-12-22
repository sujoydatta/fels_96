require "rails_helper"

describe WordAnswer do
  it "has a valid factory" do
    expect(FactoryGirl.create :word_answer).to be_valid
  end

  it {should have_many :lesson_words}
end

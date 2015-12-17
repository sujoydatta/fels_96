require "rails_helper"

describe WordAnswer do
  it "has a valid factory" do
    FactoryGirl.create(:word_answer).should be_valid
  end

  it {should have_many :lesson_words}
end

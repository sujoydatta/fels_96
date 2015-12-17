require "rails_helper"

describe WordAnswer do
  it "has a valid factory" do
    FactoryGirl.create(:word_answer).should be_valid
  end

  it "has many lesson_words" do
    t = WordAnswer.reflect_on_association :lesson_words
    expect(t.macro).to eq :has_many
  end
end

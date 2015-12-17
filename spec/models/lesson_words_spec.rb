require "rails_helper"

describe LessonWord do
  it "belongs to a lesson" do
    t = LessonWord.reflect_on_association :lesson
    expect(t.macro).to eq :belongs_to
  end

  it "belongs to a word" do
    t = LessonWord.reflect_on_association :word
    expect(t.macro).to eq :belongs_to
  end

  it "belongs to a word_answer" do
    t = LessonWord.reflect_on_association :word_answer
    expect(t.macro).to eq :belongs_to
  end
end

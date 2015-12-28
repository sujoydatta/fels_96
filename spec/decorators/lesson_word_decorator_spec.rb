require 'rails_helper'

describe LessonWordDecorator do
  let(:word_answer){FactoryGirl.create :word_answer, correct: true, content: "content"}
  let!(:lesson_word){FactoryGirl.create(:lesson_word).decorate}
  let!(:lesson_word1){FactoryGirl.create(:lesson_word, word_answer_id: word_answer.id).decorate}

  it {expect(lesson_word).to be_decorated}

  it "Show result have content" do
    output = lesson_word1.show_result
    expect(output).to have_content "content"
  end

  it "Show correct have tag" do
    output = lesson_word1.show_correct
    expect(output).to have_tag :label
  end
end

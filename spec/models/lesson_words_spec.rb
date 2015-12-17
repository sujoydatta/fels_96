require "rails_helper"

describe LessonWord do
  it {should belong_to :lesson}
  it {should belong_to :word}
  it {should belong_to :word_answer}
end

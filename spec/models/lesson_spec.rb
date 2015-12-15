require "rails_helper"

describe Lesson do
  it "has a valid factory" do
    FactoryGirl.create(:lesson).should be_valid
  end

  it "has many lesson_words" do
    t = Lesson.reflect_on_association :lesson_words
    expect(t.macro).to eq :has_many
  end

  it "belongs to a user" do
    t = Lesson.reflect_on_association :user
    expect(t.macro).to eq :belongs_to
  end

  it "belongs to a category" do
    t = Lesson.reflect_on_association :category
    expect(t.macro).to eq :belongs_to
  end
end

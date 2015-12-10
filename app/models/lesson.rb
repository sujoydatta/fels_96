class Lesson < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :category
  has_many :lesson_words

  before_create :init_words
  before_update :total_result

  accepts_nested_attributes_for :lesson_words

  scope :search_by_category, ->category_id {where category_id: category_id}
  scope :search_by_user, ->user_id {where user_id: user_id}

  private
  def init_words
    @words = self.category.words.not_learn(self.user.id).sample 10
    @words.each do |word|
      self.lesson_words.build word_id: word.id
    end
  end

  def total_result
    self.lesson_result = total_correct_answer
  end

  def total_correct_answer
    lesson_words.select{|lesson_word| lesson_word.word_answer.correct? unless
      lesson_word.word_answer.nil?}.count
  end
end

class Word < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :category
  has_many :word_answers
  has_many :lesson_words

  validates :category_id,
    presence: true
  validates :content,
    presence: true,
    length: {maximum: 20},
    uniqueness: {scope: :category_id}

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:content].blank?}

  scope :learn, -> user_id{where "id IN (select word_id from
    lesson_words where word_answer_id IN (select id from word_answers where
    correct = \"t\") AND lesson_id IN (select id from lessons where
    user_id = #{user_id}))"}

  scope :not_learn, -> user_id{where "id not IN (select word_id from
    lesson_words where word_answer_id IN (select id from word_answers where
    correct = \"t\") AND lesson_id IN (select id from lessons where
    user_id = #{user_id}))"}

  scope :filter_word, ->(criteria) {
    search = criteria.split
    case search[0]
      when "all"
        Word.all
      when "unlearned"
        not_learn search[1].to_i
      else
        learn search[1].to_i
    end
  }

  class << self
    def ransackable_scopes(auth_object = nil)
      [:filter_word]
    end
  end
end

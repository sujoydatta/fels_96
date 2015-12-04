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

  scope :not_learn, -> user_id{where "id not IN (select word_id from
    lesson_words where word_answer_id IN (select id from word_answers where
    correct = \"t\") AND lesson_id IN (select id from lessons where
    user_id = #{user_id}))"}
end

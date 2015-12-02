class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers
  has_many :lesson_words

  validates :category_id,
    presence: true
  validates :content,
    presence: true,
    length: {maximum: 20},
    uniqueness: {case_sensitive: false}

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:content].blank?}
end

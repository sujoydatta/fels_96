class Category < ActiveRecord::Base
  has_many :words
  has_many :lessons

  validates :name,
    presence: true,
    length: {maximum: 30},
    uniqueness: {case_sensitive: false}
end

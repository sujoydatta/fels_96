class Category < ActiveRecord::Base
  include PublicActivity::Common

  has_many :words
  has_many :lessons

  validates :name,
    presence: true,
    length: {maximum: 30},
    uniqueness: {case_sensitive: false}

  def min_json options = {}
    {
      id: id,
      name: name
    }.merge(options)
  end
end

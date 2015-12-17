require "faker"

FactoryGirl.define do
  factory :word do
    category
    content {Faker::Name}
  end
end

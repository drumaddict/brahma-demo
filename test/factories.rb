require 'faker'
FactoryGirl.define do
  factory :thing do
    title { Faker::Hacker.noun }
    description  { Faker::Hacker.say_something_smart }
    published false
    featured true
  end
end


FactoryGirl.define do
  factory :type do
    title { Faker::App.name }
    description  {Faker::Hacker.say_something_smart }
  end
end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pfeedback do
    attrib "MyString"
    from_id "MyString"
    rating_given 1.5
    accounted_for "2014-03-24 14:10:18"
  end
end

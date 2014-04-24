# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    from_id 1
    to_id 1
    attribute_identifier "MyString"
    rating_given 1.5
    accounted_for "2014-03-20 09:43:51"
  end
end

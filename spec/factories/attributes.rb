# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attribute do
    attribute_name "MyString"
    category "MyString"
    identifier 1
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_rating do
    project_id 1
    project_attribute_identifier 1
    current_rating 1.5
    num_fb_received 1.5
  end
end

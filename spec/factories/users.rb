# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Blog Cat"
    email "cat@exsample.com"
    password "catcatcat"
  end
end

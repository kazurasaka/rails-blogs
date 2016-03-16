# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "タイトル"
    content "本文テキスト"
    user_id 1
    image "aaa/bbb.jpg"
  end
end

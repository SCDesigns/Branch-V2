FactoryGirl.define do
  factory :user do
    name "test"
    email "test@mail.com"
    password "password"
  end # this creates user_id: 1
end

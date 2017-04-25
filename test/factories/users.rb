FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "admin"
    email "admin@branch.com"
    password "itsasecret"

    trait :admin do
      role 'admin'
    end
  end
end

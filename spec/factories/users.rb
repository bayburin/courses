FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.ru" }
    password '123456'
    association :role, factory: :user_role
  end

  factory :admin, class: User do
    sequence(:email) { |n| "admin#{n}@mail.ru" }
    password '123456'
    association :role, factory: :admin_role
  end
end

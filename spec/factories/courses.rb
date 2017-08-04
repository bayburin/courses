FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Course #{n}" }

    after(:build) do |item, evaluator|
      item.themes << build_list(:theme, 2)
    end
  end
end

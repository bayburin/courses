FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Course #{n}" }

    after(:build) do |course, evaluator|
      course.themes << build_list(:theme, 2)
    end
  end

  factory :passed_course, class: Course do
    sequence(:name) { |n| "Course #{n}" }

    after(:build) do |course, evaluator|
      course.themes << build(:theme)
      course.user_courses.build(user: evaluator.users.first, passed: true)
    end
  end
end

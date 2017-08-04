class UserCourseTheme < ApplicationRecord
  belongs_to :theme
  belongs_to :user_course

  validates :theme_id, uniqueness: { scope: :user_course_id }
end

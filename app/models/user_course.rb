class UserCourse < ApplicationRecord
  has_many :user_course_themes

  belongs_to :user
  belongs_to :course
end

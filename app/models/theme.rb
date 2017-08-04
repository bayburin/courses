class Theme < ApplicationRecord
  has_many :user_course_themes, dependent: :destroy

  belongs_to :course
end

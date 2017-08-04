class Course < ApplicationRecord
  has_many :themes, dependent: :destroy
  has_many :user_courses
  has_many :users, through: :user_courses
end

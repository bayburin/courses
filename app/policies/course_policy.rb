class CoursePolicy < ApplicationPolicy
  def index?
    if user.has_role? :admin
      true
    elsif record.users.include?(user) && record.user_courses.find_by(user: user).try(:passed).to_s == 'false'
      true
    else
      false
    end
  end
end
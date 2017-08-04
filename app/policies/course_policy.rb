class CoursePolicy < ApplicationPolicy
  def index?
    if user.has_role? :admin
      true
    elsif record.users.include? user
      true
    else
      false
    end
  end
end
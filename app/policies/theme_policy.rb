class ThemePolicy < ApplicationPolicy
  def show?
    if user.has_role? :admin
      true
    elsif record.course.users.include? user
      true
    else
      false
    end
  end
end
class ThemePolicy < ApplicationPolicy
  # Для админа доступ открыт
  # Если пользователю дан доступ и он еще не изучил тему, доступ открыт
  def show?
    if user.has_role? :admin
      true
    elsif record.course.users.include?(user) && record.user_course_themes.find_by(user_course: record.course.user_courses.find_by(user: user)).nil?
      true
    else
      false
    end
  end
end
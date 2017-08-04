require 'rails_helper'

RSpec.feature 'Show all themes of the selected course', %q{
  In order to finish course
  As an authenticated user
  I want to be able to learn theme in detail
} do

  given(:user) { create :user }
  given(:course) { create :course, users: [user] }
  given(:theme) { course.themes.first }

  scenario 'User tries see detail of specified theme' do
    sign_in user
    visit course_themes_path(course)
    expect(page).to have_content 'Список курсов'
    visit course_theme_path(course.id, theme.id)

    expect(page).to have_content "Тема '#{theme.name}'."
    expect(page).to have_content theme.content
    expect(page).to have_link('Отмена', href: course_themes_path(course.id))
    expect(page).to have_selector('input[type="submit"][value="Изучено"]')
  end
end
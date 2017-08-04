require 'rails_helper'

RSpec.feature 'Show all themes of the selected course', %q{
  In order to learn theme
  As an authenticated user
  I want to be able to see all themes of the selected course
} do

  given(:user) { create :user }
  given(:course) { create :course, users: [user] }

  scenario 'User tries to go to the index page' do
    sign_in user
    visit course_themes_path(course)

    expect(page).to have_content 'Список курсов'
    expect(page).to have_link('Вернуться к списку курсов', href: courses_path)
    expect(all('tr').count).to eq course.themes.count

    within '.table' do
      course.themes.each_with_index do |theme, index|
        expect(page).to have_content theme.name
        expect(page).to have_content theme.description
        expect(all('tr')[index]).to have_link('Изучить', class: 'btn btn-default')
      end
    end
  end
end
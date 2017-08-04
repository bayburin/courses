require 'rails_helper'

RSpec.feature 'Show all themes of the selected course', %q{
  In order to learn theme
  I want to be able to see all themes of the selected course
} do

  given(:course) { create :course }
  given!(:themes) { create_list :theme, 3, course: course }

  scenario 'User tries to go to the index page' do
    visit course_themes_path(course)

    expect(page).to have_content 'Список курсов'
    expect(page).to have_link('Вернуться к списку курсов', href: courses_path)
    expect(all('tr').count).to eq themes.count
  end
end
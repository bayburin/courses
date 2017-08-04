require 'rails_helper'

RSpec.feature 'Show all courses', %q{
  In order to see all created courses
  As an authenticated user
  I want to be able to go to the index page
} do

  given(:user) { create :user }
  given!(:courses) { create_list :course, 3 }
  before do
    courses.first.user_courses.create(user: user)
  end

  scenario 'User tries to go to the index page' do
    sign_in user
    visit courses_path

    expect(page).to have_content 'Список курсов'
    within '.table' do
      expect(all('tr').count).to eq courses.count

      courses.each_with_index do |course, index|
        if index.zero?
          expect(all('tr')[index]).to have_link('Пройти', class: 'btn btn-default')
        else
          expect(all('tr')[index]).not_to have_link('Пройти', class: 'btn btn-default')
        end

        expect(page).to have_content course.name
        expect(page).to have_content course.description
      end
    end
  end
end
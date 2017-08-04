require 'rails_helper'

RSpec.feature 'Show all courses', %q{
  In order to see all created courses
  I want to be able to go to the index page
} do

  given!(:courses) { create_list :course, 3 }

  scenario 'User tries to go to the index page' do
    visit courses_path

    expect(page).to have_content 'Список курсов'
    expect(all('tr').count).to eq courses.count
  end
end
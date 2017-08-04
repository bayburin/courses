require 'rails_helper'

RSpec.describe UserCourseTheme, type: :model do
  it { is_expected.to belong_to(:theme) }
  it { is_expected.to belong_to(:user_course) }
end

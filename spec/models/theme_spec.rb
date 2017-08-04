require 'rails_helper'

RSpec.describe Theme, type: :model do
  it { is_expected.to have_many(:user_course_themes).dependent(:destroy) }
  it { is_expected.to belong_to(:course) }
end

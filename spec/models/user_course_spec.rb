require 'rails_helper'

RSpec.describe UserCourse, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:course) }
end

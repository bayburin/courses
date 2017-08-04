require 'rails_helper'

RSpec.describe Course, type: :model do
  it { is_expected.to have_many(:themes).dependent(:destroy) }
  it { is_expected.to have_many(:user_courses).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:user_courses) }
end

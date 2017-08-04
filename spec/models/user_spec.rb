require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:role) }
  it { is_expected.to have_many(:user_courses) }
  it { is_expected.to have_many(:courses).through(:user_courses) }
end

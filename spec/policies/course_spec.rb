require 'rails_helper'

describe CoursePolicy do
  subject { CoursePolicy }

  let(:admin) { create :admin }

  permissions :index? do
    let(:course) { create :course }

    context 'with admin role' do
      it 'grants access to the course' do
        expect(subject).to permit(admin, course)
      end
    end

    context 'with user role' do
      let(:user) { create :user }

      context 'and when admin allows access' do
        let(:course) { create :course, users: [user] }

        it 'grants access to the course' do
          expect(subject).to permit(user, course)
        end
      end

      context 'and when admin does not allow access' do
        let(:course) { create :course }

        it 'denies access to the course' do
          expect(subject).not_to permit(user, course)
        end
      end
    end
  end
end
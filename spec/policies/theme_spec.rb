require 'rails_helper'

describe ThemePolicy do
  subject { ThemePolicy }

  let(:admin) { create :admin }

  permissions :show? do
    let(:course) { create :course }

    context 'with admin role' do
      it 'grants access to the all themes' do
        course.themes.each do |theme|
          expect(subject).to permit(admin, theme)
        end
      end
    end

    context 'with user role' do
      let(:user) { create :user }

      context 'and when admin allows access' do
        let(:course) { create :course, users: [user] }


        it 'grants access to the course' do
          course.themes.each do |theme|
            expect(subject).to permit(user, theme)
          end
        end
      end

      context 'and when admin does not allow access' do
        let(:course) { create :course }

        it 'denies access to the course' do
          course.themes.each do |theme|
            expect(subject).not_to permit(user, theme)
          end
        end
      end
    end
  end
end
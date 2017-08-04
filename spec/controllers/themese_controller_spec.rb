require 'rails_helper'

RSpec.describe ThemesController, type: :controller do
  let(:user) { create :user }

  describe 'GET #index' do
    let(:course) { create :course, users: [user] }
    before do
      sign_in user
      get :index, params: { course_id: course.id }
    end

    it 'gets selected course' do
      expect(assigns(:course)).to eq course
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:course) { create :course, users: [user] }
    let(:theme) { course.themes.first }
    before do
      sign_in user
      get :show, params: { course_id: course.id, id: theme.id }
    end

    it 'gets selected theme' do
      expect(assigns(:theme)).to eq theme
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #pass_theme' do
    let(:course) { create :course, users: [user] }
    let(:theme) { course.themes.first }
    before { sign_in user }
    subject { post :pass_theme, params: { course_id: course.id, id: theme.id } }

    context 'when theme not passed yet by current user' do
      it 'adds new record to UserCourseTheme model if it does not exist' do
        expect { subject }.to change(UserCourseTheme, :count).by(1)
      end

      it 'redirect_to course_themes_path' do
        subject
        expect(response).to redirect_to course_themes_path(course.id)
      end
    end

    context 'when theme already passed by current user' do
      before do
        UserCourseTheme.create(theme: theme, user_course: course.user_courses.find_by(user: user))
      end

      it 'does not create a new record into UserCourseTheme model' do
        expect { subject }.not_to change(UserCourseTheme, :count)
      end

      it 'renders show view' do
        subject
        expect(response).to render_template :show
      end
    end
  end
end

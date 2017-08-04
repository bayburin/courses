require 'rails_helper'

RSpec.describe ThemesController, type: :controller do
  let(:user) { create :user }

  describe 'GET #index' do
    let(:course) { create :course }
    before do
      sign_in user
      get :index, params: { course_id: course.id }
    end

    it 'get selected course' do
      expect(assigns(:course)).to eq course
    end
  end

  describe 'GET #show' do
    let(:course) { create :course }
    let(:theme) { course.themes.first }
    before do
      sign_in user
      get :show, params: { course_id: course.id, id: theme.id }
    end

    it 'get selected theme' do
      expect(assigns(:theme)).to eq theme
    end
  end
end

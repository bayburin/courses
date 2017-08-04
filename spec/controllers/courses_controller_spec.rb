require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create :user }
    let(:courses) { create_list :course, 2 }
    before do
      sign_in user
      get :index
    end

    it 'populates an array of all courses' do
      expect(assigns(:courses)).to match_array(courses)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end

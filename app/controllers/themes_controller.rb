class ThemesController < ApplicationController
  def index
    @course = Course.includes(:themes).find(params[:course_id])
  end
end

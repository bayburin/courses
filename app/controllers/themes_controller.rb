class ThemesController < ApplicationController
  def index
    @course = Course.includes(:themes, :user_courses).find(params[:course_id])
    authorize @course
  end

  def show
    @theme = Theme.includes(:course).find(params[:id])
    authorize @theme, :show?
  end

  def
end

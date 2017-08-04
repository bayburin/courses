class ThemesController < ApplicationController
  def index
    @course = Course.includes(:themes, :user_courses).find(params[:course_id])
    authorize @course
  end

  def show
    @theme = Theme.includes(:course).find(params[:id])
    authorize @theme, :show?
  end

  def pass_theme
    @course = Course.includes(:themes, :user_courses).find(params[:course_id])
    authorize @course, :index?

    @theme = @course.themes.find(params[:id])
    @passed_theme = @theme.user_course_themes.new(user_course: @course.user_courses.find_by(user: current_user))

    if @passed_theme.save
      if @current_user.pass_course?(@course)
        @course.user_courses.find_by(user: current_user).update(passed: true)

        flash[:notice] = 'Вы прошли весь курс'
        redirect_to courses_path
      else
        flash[:notice] = 'Тема изучена'
        redirect_to course_themes_path(@theme.course.id)
      end
    else
      flash.now[:alert] = @passed_theme.errors.full_messages.join('. ')
      render :show
    end
  end

end

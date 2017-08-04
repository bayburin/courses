class CreateUserCourseThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_course_themes do |t|
      t.references :theme
      t.references :user_course
      t.timestamps
    end
  end
end

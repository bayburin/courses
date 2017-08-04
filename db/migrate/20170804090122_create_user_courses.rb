class CreateUserCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_courses do |t|
      t.references :user
      t.references :course
      t.boolean :passed, default: false
      t.timestamps
    end
  end
end

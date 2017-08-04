class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.references :course
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end

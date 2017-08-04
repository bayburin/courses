class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.references :course
      t.string :name
      t.text :description
      t.text :content
      t.timestamps
    end
  end
end

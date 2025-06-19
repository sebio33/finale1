class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :student_number
      t.integer :grade_level

      t.timestamps
    end
  end
end

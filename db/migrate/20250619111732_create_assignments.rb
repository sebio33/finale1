class CreateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.references :course, null: false, foreign_key: true
      t.date :due_date

      t.timestamps
    end
  end
end

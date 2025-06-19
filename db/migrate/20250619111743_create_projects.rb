class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.references :student, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :approved

      t.timestamps
    end
  end
end

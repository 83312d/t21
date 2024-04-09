class CreateProjectsStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end

    add_index :projects_students, %i[student_id project_id], unique: true
  end
end


class Student < ApplicationRecord

  has_many :projects_students
  has_many :projects, through: :projects_students

  scope :complete_more_than_3_projects, -> {
    joins(:projects_students)
    .where(projects_students: { status: ProjectsStudent.statuses[:completed]})
    .group("students.id")
    .having("COUNT(projects_students.project_id) > 3")
  }

end

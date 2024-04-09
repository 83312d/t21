# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

students = Student.create([
  { name: "John Doe" },
  { name: "Jane Doe" },
  { name: "Bob Dylan" },
  { name: "Charlie Tango" },
  { name: "Saburo Arasaka" },
  { name: "Jackie Welles" },
  { name: "Johnny Silverhand" },
])

projects = Project.create([
  { name: "Project 1" },
  { name: "Project 2" },
  { name: "Project 3" },
  { name: "Project 4" },
  { name: "Project 5" },
  { name: "Project 6" },
  { name: "Project 7" },
])

students.each do |s|
  projects.each do |p|
    ProjectsStudent.create(student: s, project: p, status: [:not_started, :in_progress, :completed].sample)
  end
end

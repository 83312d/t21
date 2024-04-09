
class StudentsController < ApplicationController

  def index
    @students = Student.complete_more_than_3_projects
  end

end

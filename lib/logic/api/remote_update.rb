
module Logic; module Api

  class RemoteUpdate

    attr_reader :remote_service

    def initialize
      @remote_service = Api::ReportService.new
    end

    def execute
      users_for_del = []
      users_for_add = []

      students.each do |s|
        if s.projects_students.in_progress.count > 3
          unless actual_students.include?(s.id)
            remote_service.add_user(s.id)
            users_for_add << s.id
          end
        else
          if actual_students.include?(s.id)
            remote_service.remove_user(s.id)
            users_for_del << s.id
          end
        end
      end

      { added: users_for_add, deleted: users_for_del }
    end

    private

    def actual_students
      if instance_variable_defined? :@actual_students
        instance_variable_get :@actual_students
      else
        instance_variable_set :@actual_students, remote_service.actual_users
      end
    end

    def students
      if instance_variable_defined? :@students
        instance_variable_get :@students
      else
        instance_variable_set :@students, Student.all
      end
    end

  end

end; end

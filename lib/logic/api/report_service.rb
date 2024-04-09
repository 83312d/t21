
module Logic; module Api

  class ReportService

    attr_reader :actual_users

    def initialize
      @actual_users = Array.new(7) { rand(1..10) }.uniq
    end

    def add_user(user_id)
      raise StandardError, 'lol user is already here' if @actual_users.include?(user_id)

      @actual_users << user_id
    end

    def remove_user(user_id)
      raise StandardError, 'there is no such user here' unless @actual_users.include?(user_id)

      @actual_users.delete(user_id)
    end

  end

end; end

require "rails_helper"
require "logic/api/remote_update"

RSpec.describe Logic::Api::RemoteUpdate do

  subject { described_class.new }

  describe "public methods" do
    describe "#execute" do
      let(:students) {[
        instance_double('Student', id: 1),
        instance_double('Student', id: 2),
        instance_double('Student', id: 3)
      ]}
      let(:actual_students) { [1, 3] }

      before do
        allow_any_instance_of(described_class).to receive(:students).and_return(students)
        allow_any_instance_of(described_class).to receive(:actual_students).and_return(actual_students)
        allow_any_instance_of(Logic::Api::ReportService).to receive(:add_user)
        allow_any_instance_of(Logic::Api::ReportService).to receive(:remove_user)

        students.each do |student|
          allow(student).to receive_message_chain(:projects_students, :in_progress, :count).and_return(0)
        end
      end

      it "generally works" do
        allow(students[0]).to receive_message_chain(:projects_students, :in_progress, :count).and_return(3)
        allow(students[1]).to receive_message_chain(:projects_students, :in_progress, :count).and_return(5)

        result = subject.execute

        expect(result[:added]).to contain_exactly(2)
        expect(result[:deleted]).to contain_exactly(1, 3)
      end

    end
  end # public methods

end

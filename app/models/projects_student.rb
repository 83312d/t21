
# Лучше было бы назвать StudentAssigments, но мысль пришла поздно, не стал переделывать.
class ProjectsStudent < ApplicationRecord

  belongs_to :student
  belongs_to :project

  enum status: { not_started: 0, in_progress: 1, completed: 2 }
end

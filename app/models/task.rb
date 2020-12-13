class Task < ApplicationRecord
  belongs_to :project

  scope :projmatch, -> (pro){where(project_id: pro)}
end

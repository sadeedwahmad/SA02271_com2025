class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :project_id, presence: true



  scope :projmatch, -> (pro){where(project_id: pro)}
end

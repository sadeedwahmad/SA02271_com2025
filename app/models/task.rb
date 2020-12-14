class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :start_time, presence: true #start and end time correspond to simple calender parameters
  validates :end_time, presence: true
  validates :project_id, presence: true



  scope :projmatch, -> (pro){where(project_id: pro)}
  #returns tasks matching project id
  # used in project specfic views including on home page

end

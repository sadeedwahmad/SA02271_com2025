class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks  ,dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :description,presence: true

  scope :usermatch, -> (user){where(user_id: user)}
end

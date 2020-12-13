class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks  ,dependent: :destroy


  scope :usermatch, -> (user){where(user_id: user)}
end

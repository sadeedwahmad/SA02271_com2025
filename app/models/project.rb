class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks  ,dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true

  #validated in model for client side validation gem
  # this fields are validated on client side using gem supported by jquery

  scope :usermatch, -> (user){where(user_id: user)}
  #scope returns array of projects for calenders
  # scope used in various views
  # passed in current user id , derived from devise
  end

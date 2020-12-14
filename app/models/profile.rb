class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :picture
  do_not_validate_attachment_file_type :picture

  validates :name, presence: true
  validates :email, presence: true


  scope :userprof, -> (useri){where(user_id: useri)}
  #scope returns profile for user, on retrival it is limited to one
  #creation requires user id and user id is set to unique so only one profile can be created/retrived for user
end

class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :picture
  do_not_validate_attachment_file_type :picture


  


  scope :userprof, -> (useri){where(user_id: useri)}

end

class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :picture
  do_not_validate_attachment_file_type :picture

end
